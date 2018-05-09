//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Brian Voong on 10/21/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit
import CoreData

class CompaniesController: UITableViewController {

    var companies = [Company]() // empty array
    
    @objc private func doWork() {
        
        // creating some Company objects on a background thread
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask({ (backgroundContext) in
            (0...5).forEach { (value) in
                print(value)
                let company = Company(context: backgroundContext)
                company.name = String()
            }
            
            do {
                try backgroundContext.save()
                
                DispatchQueue.main.async {
                    self.companies = CoreDataManager.shared.fetchCompanies()
                    self.tableView.reloadData()
                }
            } catch let err {
                print("Failed to save:", err)
            }
        })
        
        
        // GCD - Grand Central Despatch
        DispatchQueue.global(qos: .background).async {

        }
    }
    
    @objc private func doUpdate() {
        print("Trying to update companies on a background context")
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask { (backgroundContext) in
            
            let request: NSFetchRequest = Company.fetchRequest()
            do {
                let companies = try backgroundContext.fetch(request)
                
                companies.forEach({ (company) in
                    print(company.name ?? "")
                    company.name = "C: \(company.name ?? "")"
                })
                
                do {
                    try backgroundContext.save()
                    
                    //lets update the UI after a save
                    DispatchQueue.main.async {
                        
                        // reset will forget all of teh object you've fetch before
                        
                        CoreDataManager.shared.persistentContainer.viewContext.reset()
                        
                        // you don't want to refetch everything if you're just simply update one or two companies
                        
                        self.companies = CoreDataManager.shared.fetchCompanies()
                        
                        //is there a way to just merge the changes that you made onto the main view context
                        
                        self.tableView.reloadData()
                    }
                    
                } catch let saveErr {
                    print("Failed to save on background:", saveErr)
                }
            } catch let err {
                print("Failed to fetch company in the background: ", err)
            }
            
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.companies = CoreDataManager.shared.fetchCompanies()
        
        navigationItem.leftBarButtonItems = [
         UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset)),
         UIBarButtonItem(title: "Do Updates", style: .plain, target: self, action: #selector(doUpdate))]
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = UIColor.darkBlue
//        tableView.separatorStyle = .none
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView() // blank UIView
        
        tableView.register(CompanyCell.self, forCellReuseIdentifier: "cellId")
        
        setupPlusButtonInNavBar(selector: #selector(handleAddCompany))        
    }
    
    @objc private func handleReset() {
        print("Attempting to delete all core data objects")
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        
        do {
            try context.execute(batchDeleteRequest)
            
            // upon deletion from core data succeeded
            
            var indexPathsToRemove = [IndexPath]()
            
            for (index, _) in companies.enumerated() {
                let indexPath = IndexPath(row: index, section: 0)
                indexPathsToRemove.append(indexPath)
            }
            companies.removeAll()
            tableView.deleteRows(at: indexPathsToRemove, with: .left)
            
        } catch let delErr {
            print("Failed to delete objects from Core Data:", delErr)
        }
        
    }
    
    @objc func handleAddCompany() {
        print("Adding company..")
        
        let createCompanyController = CreateCompanyController()
//        createCompanyController.view.backgroundColor = .green
        
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        
        present(navController, animated: true, completion: nil)
        
    }
    
}
