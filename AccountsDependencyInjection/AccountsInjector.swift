//
//  AccountsInjector.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 03/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation
import UIKit

class AccountsInjector {
    
    func setup() -> AccountsViewModel {
        
        let client = AccountsClient()
        
        let viewModel = AccountsViewModel(client: client)
        
        viewModel.load()
        
        return viewModel
        
    }
    
}
