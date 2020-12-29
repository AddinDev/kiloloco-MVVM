//
//  kiloloco_MVVMTests.swift
//  kiloloco MVVMTests
//
//  Created by addin on 29/12/20.
//

import XCTest
@testable import kiloloco_MVVM

class MockDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion([User(name: "udinda")])
    }
    
    
}

class kiloloco_MVVMTests: XCTestCase {
    
    var sut: ContentView.ViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ContentView.ViewModel(dataService: MockDataService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_getUsers() throws {
        XCTAssertTrue(sut.users.isEmpty)
        sut.getUsers()
        XCTAssertEqual(sut.users.count, 1)
    }

}
