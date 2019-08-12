//
//  ImageViewBuilder.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class ImageViewBuilder {
    private let customImageView: UIImageView = {
        let imgView = UIImageView(image: nil)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    func image(_ image: UIImage) -> ImageViewBuilder {
        customImageView.image = image
        return self
    }
    
    func contentMode(_ contentMode: UIView.ContentMode) -> ImageViewBuilder {
        customImageView.contentMode = contentMode
        return self
    }
    
    func clipsToBounds(_ b: Bool) -> ImageViewBuilder {
        customImageView.clipsToBounds = b
        return self
    }
    
    func cornerRadius(_ value: CGFloat) -> ImageViewBuilder {
        customImageView.layer.cornerRadius = customImageView.frame.width / 2
        return self
    }
    
    func build() -> UIImageView {
        return customImageView
    }
}
