//
//  UserService.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

class UserService: ApiServiceProtocol {
    func getUserInfo(completion: @escaping (Bool, User?, NetworkErrors?) -> ()) {
        let dispatcher = NetworkDispatcher(environment: AppEnvironments.shared.qa)
        GetUserInfoTask().execute(in: dispatcher) { (success, user, error)  in
            completion(success, user?.first, error)
        }
    }
}
