//
//  HomeCoordinator.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var homeController: HomeController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        homeController = HomeController()
        homeController.coordinator = self
        homeController.viewModel = HomeViewModel()
        
        // Do any additional setup after pushing the view controller into the navigation.
        homeController.setupTabBarItem(with: .home, tag: 0)
        
        navigationController.pushViewController(homeController, animated: false)
    }
}

extension HomeCoordinator {
    func goToProfileSummary(profile: Profilable) {
        let coordinator = SummaryCoordinator(navigationController: navigationController, profile: profile)
        coordinator.start()
    }
    
    func goToFullExperience(experienceList: [Experience]) {
        let coordinator = ExperienceCoordinator(navigationController: navigationController, experienceList: experienceList)
        coordinator.start()
    }
    
    func goToFullSkills(skills: [Skill]) {
        let coordinator = SkillsCoordinator(navigationController: navigationController, skills: skills)
        coordinator.start()
    }
}
