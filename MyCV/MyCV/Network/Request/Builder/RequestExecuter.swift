//
//  RequestExecuter.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

struct Environment {
    var name: String
    var host: String
    var headers: [String: Any] = [:]
    var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    init(_ name: String, host: String) {
        self.name = name
        self.host = host
    }
}

protocol Dispatcher {
    init(environment: Environment)
    func execute(request: Request, completion: @escaping (Response)->()) throws
}

enum NetworkErrors: Error, Equatable {
    case badURL
    case badJSON
    case badInput
    case noData
}

class NetworkDispatcher: Dispatcher {
    private var environment: Environment
    private var session: URLSession
    
    required public init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func execute(request: Request, completion: @escaping (Response)->()) throws {
        let rq = try self.prepareURLRequest(for: request)
        let d = self.session.dataTask(with: rq, completionHandler: { (data, urlResponse, error) in
            let response = Response( (urlResponse as? HTTPURLResponse, data, error), for: request)
            completion(response)
        })
        d.resume()
    }
    
    private func prepareURLRequest(for request: Request) throws -> URLRequest {
        // Compose the url
        let sUrl = "\(environment.host)/\(request.path)"
        guard let fullUrl = URL(string: sUrl) else {
            throw NetworkErrors.badURL
        }
        var urlRequest = URLRequest(url: fullUrl)
        
        // Adding parameters
        switch request.parameters {
        case .body(let params):
            // Parameters are part of the body
            if let params = params as? [String: String] {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
            } else {
                throw NetworkErrors.badInput
            }
        case .url(let params):
            // Parameters are part of the url
            if params == nil { break }
            if let params = params as? [String: String] {
                let queryParams = params.map({ (element) -> URLQueryItem in
                    return URLQueryItem(name: element.key, value: element.value)
                })
                guard var components = URLComponents(string: sUrl) else {
                    throw NetworkErrors.badInput
                }
                components.queryItems = queryParams
                urlRequest.url = components.url
            } else {
                throw NetworkErrors.badInput
            }
        }
        
        // Add headers from environment and request
        for (key, value) in environment.headers {
            guard let value = value as? String else { continue }
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        for (key, value) in request.headers ?? [:] {
            guard let value = value as? String else { continue }
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        // Setup HTTP method
        urlRequest.httpMethod = request.method.rawValue
        
        return urlRequest
    }
}

