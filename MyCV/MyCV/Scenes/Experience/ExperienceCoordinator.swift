//
//  ExperienceCoordinator.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class ExperienceCoordinator: Coordinator {
    var navigationController: UINavigationController
    var experienceController: ExperienceController
    
    init(navigationController: UINavigationController, experienceList: [Experience]) {
        self.navigationController = navigationController
        experienceController = ExperienceController()
        experienceController.viewModel = ExperienceViewModel(experienceList: experienceList)
    }
    
    func start() {
        // Do any additional setup after pushing the view controller into the navigation.
        navigationController.pushViewController(experienceController, animated: true)
    }
}
