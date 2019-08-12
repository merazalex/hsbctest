//
//  NetworkOperation.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

protocol NetworkOperation {
    associatedtype Output
    var request: Request { get }
    
    func execute(in dispatcher: Dispatcher, completion: @escaping (Bool, Output, NetworkErrors?)->())
}
