//
//  SummaryCoordinator.swift
//  MyCV
//
//  Created by Alex Meraz on 8/9/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class SummaryCoordinator: Coordinator {
    var navigationController: UINavigationController
    var summaryController: SummaryController
    
    init(navigationController: UINavigationController, profile: Profilable) {
        self.navigationController = navigationController
        summaryController = SummaryController()
        summaryController.viewModel = SummaryViewModel(profile: profile)
    }
    
    func start() {
        navigationController.pushViewController(summaryController, animated: true)
    }
}
