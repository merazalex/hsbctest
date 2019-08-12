//
//  SkillsCoordinator.swift
//  MyCV
//
//  Created by Alex Meraz on 8/9/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class SkillsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var skillsController: SkillsController
    
    init(navigationController: UINavigationController, skills: [Skill]) {
        self.navigationController = navigationController
        skillsController = SkillsController()
        skillsController.viewModel = SkillsViewModel(skills: skills)
    }
    
    func start() {
        navigationController.pushViewController(skillsController, animated: true)
    }
}
