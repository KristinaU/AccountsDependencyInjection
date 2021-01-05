//
//  AccountsInjectorTests.swift
//  AccountsDependencyInjectionTests
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
@testable import AccountsDependencyInjection

class AccountsInjectorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testAccountsInjector() {
        let sut = AccountsInjector.setup
        XCTAssertNotNil(sut)
    }

}
