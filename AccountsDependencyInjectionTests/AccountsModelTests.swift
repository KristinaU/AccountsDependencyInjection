//
//  AccountsModelTests.swift
//  AccountsDependencyInjectionTests
//
//  Created by The App Experts on 09/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import XCTest
@testable import AccountsDependencyInjection

class AccountsModelTests: XCTestCase {
    
    var model = AccountsModel(
    openingDate: "02.02.2020",
    kind: "Current",
    title: "Account",
    number: "123",
    balance: 100.2,
    currency: "GBP",
    transactions: ["1","2","3"])
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testModelExistence() {
        
        XCTAssertNotNil(model)
        
    }
    
    func testOpeningDate() {
        
        XCTAssertEqual(model.openingDate, "02.02.2020")
        
    }
    
    func testKind() {
        
        XCTAssertEqual(model.kind, "Current")
        
    }
    
    func testTitle() {
        
        XCTAssertEqual(model.title, "Account")
        
    }
    
    func testNumber() {
        
        XCTAssertEqual(model.number, "123")
        
    }
    
    func testBalance() {
        
        XCTAssertEqual(model.balance, 100.2)
        
    }
    
    func testCurrency() {
        
        XCTAssertEqual(model.currency, "GBP")
        
    }
    
    func testTransactions() {
        
        XCTAssertEqual(model.transactions, ["1","2","3"])
        
    }
    
    func testAppendTransactions() {
        
        model.transactions.append("NewElement")
        XCTAssertEqual(model.transactions, ["1","2","3", "NewElement"])
        
    }
    
    func testNillables() {
        
        model.openingDate = ""
        model.kind = ""
        model.title = ""
        model.number = ""
        model.balance = 0
        model.currency = ""
        model.transactions = []
        
        XCTAssertEqual(model.openingDate, "")
        XCTAssertEqual(model.kind, "")
        XCTAssertEqual(model.title, "")
        XCTAssertEqual(model.number, "")
        XCTAssertEqual(model.balance, 0)
        XCTAssertEqual(model.currency, "")
        XCTAssertEqual(model.transactions, [])
        
    }

}
