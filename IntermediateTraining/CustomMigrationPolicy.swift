//
//  CustomMigrationPolicy.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 10/05/2018.
//  Copyright © 2018 Lets Build That App. All rights reserved.
//

import CoreData

class CustomMigrationPolicy: NSEntityMigrationPolicy {
    
    //type our transformation function here in just a bit
    
    @objc func transformNumEmployees(forNum: NSNumber) -> String {
        if forNum.intValue < 150 {
            return "small"
        } else {
            return "very large"
        }
    }
}
