//
//  SummaryController.swift
//  MyCV
//
//  Created by Alex Meraz on 8/9/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class SummaryController: UIViewController {
    weak var coordinator: SummaryCoordinator?
    var viewModel: SummaryViewModel?

    var profile: Profilable? {
        didSet {
            updateUI()
        }
    }
    
    private let sectionTitleLabel: UILabel = {
        return LabelBuilder().font(UIFont.boldSystemFont(ofSize: 16)).build()
    }()
    
    private let descriptionLabel: UILabel = {
        return LabelBuilder().build()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(sectionTitleLabel)
        view.addSubview(descriptionLabel)
        
        view.backgroundColor = .white
        setupSectionTitleLabel()
        setupDescriptionLabel()
        title = "SUMMARY_TITLE".localized()
        
        profile = viewModel?.profile
    }
    
    func updateUI() {
        guard let profile = profile else { return }
        sectionTitleLabel.text = profile.jobTitle
        descriptionLabel.text = profile.summary
    }
}

extension SummaryController {
    func setupSectionTitleLabel() {
        sectionTitleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.anchor(top: sectionTitleLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 10.0, left: 10.0, bottom: 0.0, right: 10.0))
    }
}
