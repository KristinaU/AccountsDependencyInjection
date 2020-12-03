//
//  ViewController.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 02/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    required init? (coder: NSCoder) {
        viewModel = AccountsViewModel(client: client)
        super.init(coder: coder)
    }

    var client = AccountsClient()
    
    var viewModel: AccountsViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.load()
        
        self.mainTableView.dataSource = self
        
    }
}

extension AccountsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getList().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.getList()[indexPath.row]
        return cell
        
    }
}

