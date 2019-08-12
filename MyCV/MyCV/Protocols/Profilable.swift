//
//  Profilable.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

protocol Profilable {
    var name: String? { get }
    var jobTitle: String? { get }
    var summary: String? { get }
    var photo: String? { get }
}
