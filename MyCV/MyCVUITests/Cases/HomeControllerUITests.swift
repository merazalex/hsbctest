//
//  HomeControllerUITests.swift
//  MyCVUITests
//
//  Created by Alex Meraz on 8/9/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import XCTest

class HomeControllerUITests: XCTestCase {
    var app: XCUIElement!
    var tablesQuery: XCUIElementQuery!
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        app = XCUIApplication()
        tablesQuery = app.tables
    }

    override func tearDown() {
        app = nil
        tablesQuery = nil
    }
    
    func evaluateExpectations(with element: XCUIElement) {
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func evaluateExpectations(_ elementQuery: XCUIElementQuery) {
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: elementQuery, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUserNameExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Alex Meraz"]/*[[".cells.staticTexts[\"Alex Meraz\"]",".staticTexts[\"Alex Meraz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }

    func testUserJobTitleExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sr iOS Developer"]/*[[".cells.staticTexts[\"Sr iOS Developer\"]",".staticTexts[\"Sr iOS Developer\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testExperienceProjectCompanyExists() {
        let label = tablesQuery.staticTexts["Liverpool"]
        evaluateExpectations(with: label)
    }
    
    func testExperienceProjectTitleExists() {
        let label = tablesQuery.staticTexts["iOS Developer"]
        evaluateExpectations(with: label)
    }
    
    func testExperienceProjectDateExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Dec 2018 - Present . 9 mos"]/*[[".cells.staticTexts[\"Dec 2018 - Present . 9 mos\"]",".staticTexts[\"Dec 2018 - Present . 9 mos\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testEducationSchoolExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Instituto Tecnológico de Culiacán"]/*[[".cells.staticTexts[\"Instituto Tecnológico de Culiacán\"]",".staticTexts[\"Instituto Tecnológico de Culiacán\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testEducationBachelorExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Bachelors, Mechatronic Engineering"]/*[[".cells.staticTexts[\"Bachelors, Mechatronic Engineering\"]",".staticTexts[\"Bachelors, Mechatronic Engineering\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testEducationDateExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2009 - 2014"]/*[[".cells.staticTexts[\"2009 - 2014\"]",".staticTexts[\"2009 - 2014\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testSkillsExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mac"]/*[[".cells.staticTexts[\"Mac\"]",".staticTexts[\"Mac\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testContactEmailExists() {
        let label = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["merazalex234@outlook.com"]/*[[".cells.staticTexts[\"merazalex234@outlook.com\"]",".staticTexts[\"merazalex234@outlook.com\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        evaluateExpectations(with: label)
    }
    
    func testExperienceSectionHeaderExists() {
        let localizedString = NSLocalizedString("HOME_SECTION_EXPERIENCE", bundle: Bundle(for: HomeControllerUITests.self), comment: "")
        let label = tablesQuery.staticTexts[localizedString]
        evaluateExpectations(with: label)
    }
    
    func testEducationSectionHeaderExists() {
        let localizedString = NSLocalizedString("HOME_SECTION_EDUCATION", bundle: Bundle(for: HomeControllerUITests.self), comment: "")
        let label = tablesQuery.staticTexts[localizedString]
        evaluateExpectations(with: label)
    }
    
    func testSkillSectionHeaderExists() {
        let localizedString = NSLocalizedString("HOME_SECTION_SKILLS", bundle: Bundle(for: HomeControllerUITests.self), comment: "")
        let label = tablesQuery.staticTexts[localizedString]
        evaluateExpectations(with: label)
    }
    
    func testContactSectionHeaderExists() {
        let localizedString = NSLocalizedString("HOME_SECTION_CONTACT", bundle: Bundle(for: HomeControllerUITests.self), comment: "")
        let label = tablesQuery.staticTexts[localizedString]
        evaluateExpectations(with: label)
    }
}
