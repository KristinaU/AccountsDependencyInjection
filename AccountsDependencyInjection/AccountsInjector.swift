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
        
        client.decoder = MyDecoder()
        
        client.networkManager = NetworkManager()
        
        client.urlString = "https://my-json-server.typicode.com/KristinaU/AccountsDependencyInjection/accounts"
        
        let viewModel = AccountsViewModel(client: client)
        
        return viewModel
        
    }
    
}
