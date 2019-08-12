//
//  ResponseParser.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

public enum Response {
    case json(_: [String: Any]?)
    case data(_: Data)
    case error(_: Int?, _: Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode, NetworkErrors.noData)
            return
        }
        
        switch request.dataType {
        case .Data:
            self = .data(data)
        case .JSON:
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                self = .json(json)
            } else {
                self = .error(response.r?.statusCode, NetworkErrors.badJSON)
            }
        }
    }
    
}
