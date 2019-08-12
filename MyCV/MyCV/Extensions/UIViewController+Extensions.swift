//
//  UIViewController+Extensions.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

extension UIViewController {
    func setUpNavigationBar(_ title: String) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    func setupTabBarItem(with storyboardName: ControllerNames, tag: Int) {
        self.tabBarItem = UITabBarItem(title: nil, image: storyboardName.image, tag: tag)
    }
}
