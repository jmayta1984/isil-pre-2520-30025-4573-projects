//
//  Persistence.swift
//  EasyTravel
//
//  Created by Alumno on 7/11/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    private init() {
        
        container = NSPersistentContainer(name: "EasyTravel")
        container.loadPersistentStores { _, error in
            if let error  {
                fatalError(error.localizedDescription)
            }
        }
    }
    
}
