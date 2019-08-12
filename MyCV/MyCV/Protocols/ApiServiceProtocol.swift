//
//  ApiServiceProtocol.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

protocol ApiServiceProtocol: class {
    func getUserInfo(completion: @escaping (Bool, User?, NetworkErrors?)->())
}
