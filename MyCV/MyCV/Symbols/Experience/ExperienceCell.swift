//
//  ExperienceCell.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class ExperienceCell: UITableViewCell {

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
    
    private let responsibilitiesLabel: UILabel = {
        return LabelBuilder().build()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sectionImage)
        addSubview(sectionTitleLabel)
        addSubview(sectionSubtitleLabel)
        addSubview(descriptionLabel)
        addSubview(responsibilitiesLabel)
        
        setupSectionViewImage()
        setupSectionTitleLabel()
        setupSectionSubtitleLabel()
        setupDescriptionLabel()
        setupResponsibilitiesLabel()
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
    
    func configure(_ experience: Experience) {
        sectionImage.loadFromURL(experience.companyLogo ?? "")
        sectionTitleLabel.text = experience.position
        sectionSubtitleLabel.text = experience.companyName
        descriptionLabel.text = experience.date
        responsibilitiesLabel.text = experience.responsibilities
    }
}

extension ExperienceCell {
    func setupSectionViewImage() {
        sectionImage.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: nil, padding: .init(top: 10.0, left: 10.0, bottom: 10.0, right: 0.0))
        sectionImage.size(.init(width: 90.0, height: 90.0))
    }
    
    func setupSectionTitleLabel() {
        sectionTitleLabel.anchor(top: topAnchor, bottom: nil, leading: sectionImage.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupSectionSubtitleLabel() {
        sectionSubtitleLabel.anchor(top: sectionTitleLabel.bottomAnchor, bottom: nil, leading: sectionImage.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.anchor(top: sectionSubtitleLabel.bottomAnchor, bottom: nil, leading: sectionImage.trailingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupResponsibilitiesLabel() {
        responsibilitiesLabel.anchor(top: sectionImage.bottomAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0))
    }
}
