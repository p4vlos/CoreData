//
//  EmployeesController.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 30/04/2018.
//  Copyright © 2018 Pavlos Nicolaou. All rights reserved.
//

import UIKit

class EmployeesController: UITableViewController {
    
    var company: Company?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = company?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.darkBlue
        
        setupPlusButtonInNavBar(selector: #selector(handleAdd))
    }
    
    @objc private func handleAdd() {
        let createEmployeeController = CreateEmployeeController()
        let navController = UINavigationController(rootViewController: createEmployeeController)
        present(navController, animated: true, completion: nil)
    }
    
    
}
