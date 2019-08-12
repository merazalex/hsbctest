//
//  ProfileCell.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    private let profileImage: UIImageView = {
        return ImageViewBuilder().build()
    }()
    
    private let profileNameLabel: UILabel = {
        return LabelBuilder().font(UIFont.boldSystemFont(ofSize: 16)).textAligment(.center).build()
    }()
    
    private let profileJobTitle: UILabel = {
        return LabelBuilder().textAligment(.center).build()
    }()
    
    private let profileSummaryLabel: UILabel = {
        return LabelBuilder().textAligment(.center).numberOfLines(3).build()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(profileImage)
        addSubview(profileNameLabel)
        addSubview(profileJobTitle)
        addSubview(profileSummaryLabel)
        
        setupProfileImage()
        setupProfileNameLabel()
        setupProfileJobtitle()
        setupProfileSummaryLabel()
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
    
    func configure(_ profile: Profilable) {
        profileImage.loadFromURL(profile.photo ?? "")
        profileNameLabel.text = profile.name
        profileJobTitle.text = profile.jobTitle
        profileSummaryLabel.text = profile.summary
    }

}

extension ProfileCell {
    func setupProfileImage() {
        profileImage.center(yAxis: nil, xAxis: centerXAnchor)
        profileImage.anchor(top: topAnchor, bottom: nil, leading: nil, trailing: nil, padding: .init(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0))
        profileImage.size(.init(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3))
    }
    
    func setupProfileNameLabel() {
        profileNameLabel.anchor(top: profileImage.bottomAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupProfileJobtitle() {
        profileJobTitle.anchor(top: profileNameLabel.bottomAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupProfileSummaryLabel() {
        profileSummaryLabel.anchor(top: profileJobTitle.bottomAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0))
    }
}
