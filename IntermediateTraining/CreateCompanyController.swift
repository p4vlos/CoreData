//
//  CraeteCompanyController.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 19/04/2018.
//  Copyright © 2018 Pavlos Nicolaou. All rights reserved.
//

import UIKit

//Custom Delegation

protocol CreateCompanyControllerDelegate {
    func didAddCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    
    //not tightly-coupled
    var delegate: CreateCompanyControllerDelegate?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        //enable autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        navigationItem.title = "Create Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.backgroundColor = .darkBlue
    }
    
    @objc private func handleSave() {
        
        dismiss(animated: true) {
            guard let name = self.nameTextField.text else { return }
            
            let company = Company(name: name, founded: Date())
            self.delegate?.didAddCompany(company: company)
        }
    }
    
    @objc private func setupUI() {
        let lightBlueBackroundView = UIView()
        lightBlueBackroundView.backgroundColor = .lightBlue
        lightBlueBackroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackroundView)
        lightBlueBackroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
