//
//  ExperienceController.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class ExperienceController: UITableViewController {
    weak var coordinator: ExperienceCoordinator?
    var viewModel: ExperienceViewModel?
    
    var experienceList: [Experience]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "HOME_SECTION_EXPERIENCE".localized()
        
        experienceList = viewModel?.experienceList
    }
    
    func setupTableView() {
        tableView.register(ExperienceCell.self)
    }
}

// MARK: - Table view data source
extension ExperienceController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experienceList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ExperienceCell.self, for: indexPath)
        if let experienceList = experienceList {
            let currentExperience = experienceList[indexPath.row]
            cell.configure(currentExperience)
        }
        return cell
    }
}
