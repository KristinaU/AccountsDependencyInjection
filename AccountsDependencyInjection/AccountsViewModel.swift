//
//  AccountsViewModel.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 02/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class AccountsViewModel {
    
    var client: AccountsClient
    
    init(client: AccountsClient) {
         self.client = client
    }
    
    func load() {
        self.client.load()
    }
    
    func getTitles() -> [String] {
        return client.titlesArray
    }
    
    func getList() -> [String] {
        if (client.arrayCompletion) {
            return client.titlesArray
        }
        else {
            return ["Something went wrong"]
        }
    }
    
}
