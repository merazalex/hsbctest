//
//  AppEnvironments.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

class AppEnvironments {
    static let shared = AppEnvironments()
    
    let qa = Environment("QA", host: "https://5d4c2d3000dbb1001487a60d.mockapi.io/mycvapi/v1")
    let prod = Environment("PROD", host: "")
}
