//
//  MainController.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homeCoordinator.start()
        
        viewControllers = [
            homeCoordinator.navigationController
        ]
    }
    
}
