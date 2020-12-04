//
//  UIElementsTests.swift
//  AccountsDependencyInjectionTests
//
//  Created by The App Experts on 03/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import XCTest
@testable import AccountsDependencyInjection

class UIElementsTests: XCTestCase {
    
    private var sut: AccountsViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "AccountsViewController") as? AccountsViewController
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableView_shouldBeConnected() {
        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.mainTableView)
        
    }
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
