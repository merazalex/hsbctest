//
//  UIImageView+Extensions.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadFromURL(_ url: String) {
        self.image = nil
        guard let url = URL(string: url) else { return }
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                let dataTask = session.dataTask(with: request) { (data, response, error) in
                    if let _ = error {
                        return
                    }
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
                dataTask.resume()
            }
        }
    }
    
}
