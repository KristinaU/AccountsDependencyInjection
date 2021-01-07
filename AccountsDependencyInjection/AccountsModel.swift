//
//  AccountsModel.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 02/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct AccountsModel: Codable {
    
    var openingDate: String
    var kind: String
    var title: String
    var number: String
    var balance: Double
    var currency: String
    var transactions: [String]
    
    private enum CodingKeys: String, CodingKey {
        
        case openingDate = "opening date"
        case kind
        case title
        case number
        case balance
        case currency
        case transactions
        
        }
}
