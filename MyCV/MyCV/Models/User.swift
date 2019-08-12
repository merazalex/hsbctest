//
//  User.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

typealias MainUser = [User]

struct User: Codable, Profilable {
    let id: String?
    let name: String?
    let jobTitle: String?
    let summary: String?
    let photo: String?
    let experience: [Experience]?
    let education: Education?
    let skills: [Skill]?
    let contact: [Contact]?
}
