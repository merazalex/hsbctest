//
//  LabelBuilder.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class LabelBuilder {
    private let customLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    func textColor(_ color: UIColor) -> LabelBuilder {
        customLabel.textColor = color
        return self
    }
    
    func font(_ font: UIFont) -> LabelBuilder {
        customLabel.font = font
        return self
    }
    
    func textAligment(_ aligment: NSTextAlignment) -> LabelBuilder {
        customLabel.textAlignment = aligment
        return self
    }
    
    func numberOfLines(_ lines: Int) -> LabelBuilder {
        customLabel.numberOfLines = lines
        return self
    }
    
    func text(_ text: String) -> LabelBuilder {
        customLabel.text = text
        return self
    }
    
    func build() -> UILabel {
        return customLabel
    }
}
