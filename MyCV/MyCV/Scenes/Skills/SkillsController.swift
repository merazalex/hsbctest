//
//  SkillsController.swift
//  MyCV
//
//  Created by Alex Meraz on 8/9/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class SkillsController: UITableViewController {
    weak var coordinator: SkillsCoordinator?
    var viewModel: SkillsViewModel?
    
    var skills: [Skill]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        title = "SKILLS_TITLE".localized()
        skills = viewModel?.skills
    }
    
    func setupTableView() {
        tableView.register(NameCell.self)
    }
}

extension SkillsController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let skills = skills else { return "" }
        let currentSkill = skills[section]
        return currentSkill.skillType
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return skills?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let skills = skills else { return 0 }
        let currentSkill = skills[section]
        return currentSkill.value?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let skills = skills else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(with: NameCell.self, for: indexPath)
        let currentSkill = skills[indexPath.section]
        if let skills = currentSkill.value {
            let skill = skills[indexPath.row]
            cell.configure(skill)
        }
        return cell
    }
}
