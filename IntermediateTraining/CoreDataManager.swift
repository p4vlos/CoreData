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
    
    func fetchCompanies() -> [Company] {
        //attempt my core data fetch
        //initialization of our Core Data stack
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchErr {
            print("Failed to fetch companies: ", fetchErr)
            return []
        }
    }
    
    func createEmployee(employeeName: String) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        
        //create an employee
        let employee  = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employee.setValue(employeeName, forKey: "name")
        
        do {
            try context.save()
            //save succeeds
            return (employee, nil)
        } catch let err {
            print("Failed to create employee: ", err )
            return (nil, err)
        }
    }
    
}
