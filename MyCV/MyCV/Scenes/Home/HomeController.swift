//
//  HomeController.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    weak var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel?
    
    var homeSections: [HomeSections]? {
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
        setUpNavigationBar("MAIN_TITLE".localized())
        viewModel?.delegate = self
        viewModel?.getUser()
    }
    
    func setupTableView() {
        tableView.register(ProfileCell.self)
        tableView.register(HomeSectionCell.self)
        tableView.register(NameCell.self)
    }
}

extension HomeController: HomeViewModelDelegate {
    func didUpdateHomeSections(_ homeSections: [HomeSections]?) {
        guard let homeSections = homeSections else { return }
        self.homeSections = homeSections
    }
}

extension HomeController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let homeSections = homeSections else { return "" }
        let currentHomeSection = homeSections[section]
        return currentHomeSection.title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return homeSections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let homeSections = homeSections else { return 0 }
        let currentHomeSection = homeSections[section]
        switch currentHomeSection {
        case .profile(_):
            return 1
        case .experience(let list):
            return list.count
        case .education(_):
            return 1
        case .skills(let list):
            return list.count
        case .contact(let list):
            return list.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let homeSections = homeSections else { return UITableViewCell() }
        let currentHomeSection = homeSections[indexPath.section]
        switch currentHomeSection {
        case .profile(let profile):
            let cell = tableView.dequeueReusableCell(with: ProfileCell.self, for: indexPath)
            cell.configure(profile)
            return cell
        case .experience(let list):
            let cell = tableView.dequeueReusableCell(with: HomeSectionCell.self, for: indexPath)
            let currentExperience = list[indexPath.row]
            cell.configure(currentExperience)
            return cell
        case .education(let education):
            let cell = tableView.dequeueReusableCell(with: HomeSectionCell.self, for: indexPath)
            cell.configure(education)
            return cell
        case .skills(let list):
            let cell = tableView.dequeueReusableCell(with: NameCell.self, for: indexPath)
            let currentSkill = list[indexPath.row]
            cell.configure(currentSkill)
            return cell
        case .contact(let list):
            let cell = tableView.dequeueReusableCell(with: HomeSectionCell.self, for: indexPath)
            let currentContact = list[indexPath.row]
            cell.configure(currentContact)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let homeSections = homeSections else { return }
        let currentHomeSection = homeSections[indexPath.section]
        switch currentHomeSection {
        case .profile(let profile):
            coordinator?.goToProfileSummary(profile: profile)
        case .experience(_):
            coordinator?.goToFullExperience(experienceList: viewModel?.getUserExperienceList() ?? [])
        case .skills(_):
            coordinator?.goToFullSkills(skills: viewModel?.getUserSkillList() ?? [])
        default:
            return
        }
    }
}
