//
//  ViewController.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 02/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var mainTableView: UITableView!
    
    var viewModel: AccountsViewModel

    init?(coder: NSCoder, viewModel: AccountsViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a viewModel.")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mainTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.getListLength()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.getTitleAtPosition(index: indexPath)
        return cell
        
    }
}

