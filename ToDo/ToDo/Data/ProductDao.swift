//
//  ProductDao.swift
//  ToDo
//
//  Created by Alumno on 31/10/25.
//

import CoreData

class ProductDao {
    static let shared = ProductDao()
    let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    
    func insertTask(task: Task) {
        let entity = TaskEntity(context: context)
        entity.id = task.id
        entity.name = task.name
        saveContext()
    }
    
    func deleteTask(task: Task) {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", task.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func updateTask(task: Task) {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", task.id as CVarArg)
        
        do {
            if let entity = try context.fetch(request).first {
                entity.name = task.name
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchAll() -> [Task] {
        let request: NSFetchRequest<TaskEntity>
        request = TaskEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            let tasks = entities.map { entity in
                Task(
                    id: entity.id ?? UUID(),
                    name: entity.name ?? "")
            }
            return tasks
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if (context.hasChanges) {
            do  {
                try context.save()
            }  catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
