//
//  MockUserService.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

class MockUserService: ApiServiceProtocol {
    var completeClosure: ((Bool, User?, NetworkErrors?)->())!
    var isGetUserInfoCalled = false
    
    func getUserInfo(completion: @escaping (Bool, User?, NetworkErrors?) -> ()) {
        isGetUserInfoCalled = true
        completeClosure = completion
    }
    
    func fail(error: NetworkErrors) {
        completeClosure(false, nil, error)
    }
}
