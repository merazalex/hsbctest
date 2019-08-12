//
//  HomeViewModelTest.swift
//  MyCVTests
//
//  Created by Alex Meraz on 8/8/19.
//  Copyright © 2019 Alex Meraz. All rights reserved.
//

import XCTest
@testable import MyCV

class HomeViewModelTest: XCTestCase {
    var viewModel: HomeViewModel!
    var mockService: MockUserService!
    
    override func setUp() {
        super.setUp()
        mockService = MockUserService()
        viewModel = HomeViewModel(service: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
    }
    
    func testGetUserInfoIsCalled() {
        viewModel.getUser()
        XCTAssert(mockService.isGetUserInfoCalled)
    }
    
    func testGetUserInfoFailNoData() {
        let error = NetworkErrors.noData
        verifyNetworkError(error: error)
    }
    
    func testGetUserInfoFailBadInput() {
        let error = NetworkErrors.badInput
        verifyNetworkError(error: error)
    }
    
    func testGetUserInfoFailBadJson() {
        let error = NetworkErrors.badJSON
        verifyNetworkError(error: error)
    }
    
    func testGetUserInfoFailBadUrl() {
        let error = NetworkErrors.badURL
        verifyNetworkError(error: error)
    }
    
    func verifyNetworkError(error: NetworkErrors) {
        viewModel.getUser()
        mockService.fail(error: error)
        if let viewModelError = viewModel.error {
            XCTAssertEqual(viewModelError, error)
        } else {
            XCTAssert(false)
        }
    }
    
}
