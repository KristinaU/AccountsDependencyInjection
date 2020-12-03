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
    
    let coder = NSCoder()
    
    func setup() -> UIViewController {
    
        let viewController = AccountsViewController(coder: coder)
        
        viewController?.client = AccountsClient()
        
        return viewController!
        
    }
    
    
    
}

    



