//
//  HomeSectionCell.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class HomeSectionCell: UITableViewCell {

    private let sectionImage: UIImageView = {
        return ImageViewBuilder().build()
    }()
    
    private let sectionTitleLabel: UILabel = {
        return LabelBuilder().font(UIFont.boldSystemFont(ofSize: 16)).build()
    }()
    
    private let sectionSubtitleLabel: UILabel = {
        return LabelBuilder().build()
    }()
    
    private let descriptionLabel: UILabel = {
        return LabelBuilder().build()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sectionImage)
        addSubview(sectionTitleLabel)
        addSubview(sectionSubtitleLabel)
        addSubview(descriptionLabel)
        
        setupSectionViewImage()
        setupSectionTitleLabel()
        setupSectionSubtitleLabel()
        setupDescriptionLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(_ section: Sectionable) {
        sectionImage.loadFromURL(section.photo ?? "")
        sectionTitleLabel.text = section.title
        sectionSubtitleLabel.text = section.subtitle
        descriptionLabel.text = section.description
    }
}

extension HomeSectionCell {
    func setupSectionViewImage() {
        sectionImage.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: nil, padding: .init(top: 10.0, left: 10.0, bottom: 10.0, right: 0.0))
        sectionImage.size(.init(width: 90.0, height: 90.0))
    }
    
    func setupSectionTitleLabel() {
        sectionTitleLabel.anchor(top: topAnchor, bottom: nil, leading: sectionImage.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupSectionSubtitleLabel() {
        sectionSubtitleLabel.anchor(top: sectionTitleLabel.bottomAnchor, bottom: nil, leading: sectionImage.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.anchor(top: sectionSubtitleLabel.bottomAnchor, bottom: bottomAnchor, leading: sectionImage.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0))
    }
}
