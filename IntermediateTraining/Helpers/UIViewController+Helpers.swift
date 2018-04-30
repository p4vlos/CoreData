//
//  UIViewController+Helpers.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 30/04/2018.
//  Copyright © 2018 Pavlos Nicolaou. All rights reserved.
//

import UIKit

extension UIViewController {
    //mu extension/helper methods
    
    func setupPlusButtonInNavBar(selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: selector)
    }
    
    func setupCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelModel))
    }
    
    @objc func handleCancelModel() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLightBackgroundView(height: CGFloat) -> UIView {
        let lightBlueBackroundView = UIView()
        lightBlueBackroundView.backgroundColor = .lightBlue
        lightBlueBackroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackroundView)
        lightBlueBackroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackroundView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return lightBlueBackroundView
    }
}
