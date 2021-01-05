//
//  AccountsViewModelTests.swift
//  AccountsDependencyInjectionTests
//
//  Created by The App Experts on 11/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import XCTest
@testable import AccountsDependencyInjection

class AccountsViewModelTests: XCTestCase {
    
    var client = AccountsClient()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testgetTitles() {
        client.load()
        let sut = AccountsViewModel(client: client)
        let titles = sut.getTitles()
        XCTAssertNotNil(titles)
    }
    
    func testgetList() {
        client.load()
        let sut = AccountsViewModel(client: client)
        let list = sut.getList()
        XCTAssertNotNil(list)
        XCTAssertNotEqual(list, ["Something went wrong"])
    }

}
