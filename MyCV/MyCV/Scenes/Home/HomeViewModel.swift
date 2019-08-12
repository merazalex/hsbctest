//
//  HomeViewModel.swift
//  MyCV
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func didUpdateHomeSections(_ homeSections: [HomeSections]?)
}

class HomeViewModel {
    let service: ApiServiceProtocol
    var error: NetworkErrors?
    weak var delegate: HomeViewModelDelegate?
    
    var user: User?
    var homeSections: [HomeSections]? {
        didSet {
            self.delegate?.didUpdateHomeSections(homeSections)
        }
    }
    
    init(service: ApiServiceProtocol = UserService()) {
        self.service = service
    }
}

extension HomeViewModel {
    func createHomeSections(with user: User?) {
        guard let user = user else { return }
        let profileSection = createProfileSection(with: user)
        let experienceSection = createExperienceSection(with: user)
        let educationSection = createEducationSection(with: user)
        let skillsSection = createSkillsSection(with: user)
        let contactSection = createContactSection(with: user)
        
        let newHomeSections = [profileSection, experienceSection, educationSection, skillsSection, contactSection]
        homeSections = newHomeSections
    }
    
    func createProfileSection(with user: User) -> HomeSections {
        let newProfile = Profile(name: user.name, jobTitle: user.jobTitle, summary: user.summary, photo: user.photo)
        let profileSection = HomeSections.profile(newProfile)
        return profileSection
    }
    
    func createExperienceSection(with user: User) -> HomeSections {
        let experienceList = user.experience ?? []
        var sections = [Section]()
        for experience in experienceList {
            let section = Section(photo: experience.companyLogo, title: experience.position, subtitle: experience.companyName, description: experience.date)
            sections.append(section)
        }
        let experienceSection = HomeSections.experience(sections)
        return experienceSection
    }
    
    func createEducationSection(with user: User) -> HomeSections {
        let education = user.education
        let section = Section(photo: education?.photo, title: education?.school, subtitle: education?.bachelor, description: education?.date)
        let educationSection = HomeSections.education(section)
        return educationSection
    }
    
    func createSkillsSection(with user: User) -> HomeSections {
        let topSkill = user.skills?.first
        let skillList = topSkill?.value ?? []
        var skillNames = [String]()
        for skill in skillList {
            skillNames.append(skill)
        }
        let skillsSection = HomeSections.skills(skillNames)
        return skillsSection
    }
    
    func createContactSection(with user: User) -> HomeSections {
        let contactList = user.contact ?? []
        var sections = [Section]()
        for contact in contactList {
            let section = Section(photo: contact.photo, title: contact.name, subtitle: contact.value, description: nil)
            sections.append(section)
        }
        let contactSection = HomeSections.contact(sections)
        return contactSection
    }
}

extension HomeViewModel {
    func getUser() {
        service.getUserInfo { [weak self] (success, user, error) in
            if let error = error {
                self?.error = error
            } else {
                guard let user = user else { return }
                self?.user = user
                self?.createHomeSections(with: user)
            }
        }
    }
    
    func getUserExperienceList() -> [Experience] {
        guard let user = user, let experienceList = user.experience else { return [] }
        return experienceList
    }
    
    func getUserSkillList() -> [Skill] {
        guard let user = user, let skillList = user.skills else { return [] }
        return skillList
    }
}
