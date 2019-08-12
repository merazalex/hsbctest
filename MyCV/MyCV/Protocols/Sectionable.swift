//
//  Sectionable.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

protocol Sectionable {
    var photo: String? { get }
    var title: String? { get }
    var subtitle: String? { get }
    var description: String? { get }
}
