//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 22/12/2017.
//  Copyright © 2017 Pavlos Nicolaou. All rights reserved.
//

import UIKit

class CompaniesController: UITableViewController {
    
    //let: constant
    //var: variable that can be modifield
    var companies = [
        Company(name: "Apple", founded: Date()),
        Company(name: "Google", founded: Date()),
        Company(name: "Amazon", founded: Date())
    ]
    
    func addCompany(company: Company) {
        //1 - modify your array
        companies.append(company)
        
        //2 - insert new index path into tableView
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = .darkBlue
//        tableView.separatorStyle = .none //removes the separators
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView() //blank UIView
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        
    }
    
    @objc private func handleAddCompany() {
        print("Adding")
        
        let createCompanyController = CreateCompanyController()
        let navController = UINavigationController(rootViewController: createCompanyController)
        
        createCompanyController.companiesController = self
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }


    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        
        cell.backgroundColor = .tealColor
        
        let company = companies[indexPath.row].name
        cell.textLabel?.text = company
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }

}

