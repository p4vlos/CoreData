//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 22/12/2017.
//  Copyright © 2017 Pavlos Nicolaou. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1)
//        tableView.separatorStyle = .none
        
        tableView.tableFooterView = UIView() //blank UIView
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        
        
        setupNavigationStyle()
    }
    
    @objc func handleAddCompany() {
        print("Adding")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        let tealColor = UIColor(red: 48/255, green: 164/255, blue: 164/255, alpha: 1)
        cell.backgroundColor = tealColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8 //arbitrary
    }
    
    func setupNavigationStyle() {
        navigationController?.navigationBar.isTranslucent = false
        
        let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = lightRed
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

}

