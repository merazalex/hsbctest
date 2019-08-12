//
//  Enums.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

enum ControllerNames: String {
    case home = "Home"
    case experience = "Experience"
    
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage.init(named: "homeSelectedTB")
        default:
            return nil
        }
    }
}

enum HomeSections {
    case profile(_ profile: Profilable)
    case experience(_ experiences: [Sectionable])
    case education(_ education: Sectionable)
    case skills(_ skills: [String])
    case contact(_ contact: [Sectionable])
    
    var title: String {
        switch self {
        case .profile:
            return ""
        case .experience:
            return "HOME_SECTION_EXPERIENCE".localized()
        case .education:
            return "HOME_SECTION_EDUCATION".localized()
        case .skills:
            return "HOME_SECTION_SKILLS".localized()
        case .contact:
            return "HOME_SECTION_CONTACT".localized()
        }
    }
}
