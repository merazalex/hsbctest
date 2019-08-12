//
//  RequestBuilder.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

enum DataType {
    case JSON
    case Data
}

enum HTTPMethod: String {
    case post   = "POST"
    case put    = "PUT"
    case get    = "GET"
    case delete = "DELETE"
    case patch  = "PATCH"
}

enum RequestParameters {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParameters { get }
    var headers: [String: Any]? { get }
    var dataType: DataType { get }
}
