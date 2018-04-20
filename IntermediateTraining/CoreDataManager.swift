//
//  CoreDataManager.swift
//  IntermediateTraining
//
//  Created by Pavlos Nicolaou on 20/04/2018.
//  Copyright © 2018 Pavlos Nicolaou. All rights reserved.
//

import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager() // will live forever as long as your application is still alive, it's properties will too
    
    let persistentContainer: NSPersistentContainer = {
        //initialization of our Core Data stack
        let container = NSPersistentContainer(name: "IntermidiateTrainingModels")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
}
