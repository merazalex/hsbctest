//
//  UserRequest.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

enum UserRequest: Request {
    
    case getInfo
    
    var path: String {
        switch self {
        case .getInfo:
            return "user"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getInfo:
            return .get
        }
    }
    
    var parameters: RequestParameters {
        switch self {
        case .getInfo:
            return .url(nil)
        }
    }
    
    var headers: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var dataType: DataType {
        switch self {
        case .getInfo:
            return .Data
        }
    }
}

class GetUserInfoTask: NetworkOperation {
    var request: Request {
        return UserRequest.getInfo
    }
    
    func execute(in dispatcher: Dispatcher, completion: @escaping (Bool, MainUser?, NetworkErrors?)->()) {
        do {
            try dispatcher.execute(request: self.request, completion: { (response) in
                switch response {
                case .data(let jsonData):
                    let mainUser = try? JSONDecoder().decode(MainUser.self, from: jsonData)
                    completion(true, mainUser, nil)
                case .json(_):
                    completion(false, nil, NetworkErrors.noData)
                case .error(_, _):
                    completion(false, nil, NetworkErrors.noData)
                }
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
