//
//  ViewController.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 03/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goToAccounts(_ sender: Any) {
    
        let accountsInjector = AccountsInjector()
        
            guard let vc = storyboard?.instantiateViewController(identifier: "AccountsViewController", creator: { coder in
                return AccountsViewController(coder: coder, viewModel: accountsInjector.setup())
            }) else {
                fatalError("Failed to load EditUserViewController from storyboard.")
            }

            navigationController?.pushViewController(vc, animated: true)
        
    }

}
