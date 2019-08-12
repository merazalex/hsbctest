//
//  UITableView+Extensions.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type, isFromNib: Bool = false, bundle: Bundle? = nil) {
        if isFromNib {
            let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
            register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable table view cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
