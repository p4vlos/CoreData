//
//  CraeteCompanyController.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 19/04/2018.
//  Copyright © 2018 Pavlos Nicolaou. All rights reserved.
//

import UIKit

class CreateCompanyController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Create Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        view.backgroundColor = .darkBlue
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
