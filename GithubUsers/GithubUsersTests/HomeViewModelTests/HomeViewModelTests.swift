//
//  HomeViewModelTests.swift
//  GithubUsersTests
//
//  Created by Swelen Ebert on 16/09/24.
//

import XCTest
@testable import GithubUsers

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var userRepositoryMock: UserRepositoryMock!
    
    override func setUp() {
        super.setUp()
        userRepositoryMock = UserRepositoryMock()
        viewModel = HomeViewModel(repository: userRepositoryMock)
    }
    
    override func tearDown() {
        userRepositoryMock = nil
        viewModel = nil
        super.tearDown()
    }
    
    func test_listAllUsers_success() {
        let expectation = XCTestExpectation(description: "Expecting to load users successfully")
        
        userRepositoryMock.error = nil
        
        viewModel.listAllUsers()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            XCTAssertEqual(self?.viewModel.cellViewModel.value?.count, 1)
            XCTAssertEqual(self?.viewModel.cellViewModel.value?.first?.name, "swelencesario")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_listAllUsers_failure() {
        let expectation = XCTestExpectation(description: "Expecting to trigger showError due to error")
        
        userRepositoryMock.error = ResponseError.genericError
 
        viewModel.showError = {
            expectation.fulfill()
        }
        
        viewModel.listAllUsers()
        
        wait(for: [expectation], timeout: 1.0)
    }
}

