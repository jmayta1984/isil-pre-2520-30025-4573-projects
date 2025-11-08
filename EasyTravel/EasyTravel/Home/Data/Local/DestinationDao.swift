//
//  DestinationDao.swift
//  EasyTravel
//
//  Created by Alumno on 7/11/25.
//

import CoreData

class DestinationDao {
    
    static let shared = DestinationDao()
    let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    
    func insert(destination: Destination) {
        let entity = DestinationEntity(context: context)
        entity.id = Int16(destination.id)
        entity.title = destination.title
        entity.posterPath = destination.posterPath
        entity.overview = destination.overview
        saveContext()
    }
    
    func delete(id: Int) {
        let request: NSFetchRequest<DestinationEntity>
        request = DestinationEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", id )
        
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
    
    func fetchAll() -> [Destination] {
        let request: NSFetchRequest<DestinationEntity>
        request = DestinationEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map({ Destination(id: Int($0.id), title: $0.title ?? "", posterPath: $0.posterPath ?? "", overview: $0.overview ?? "")})
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    
    private func saveContext() {
        if (context.hasChanges) {
            try? context.save()
        }
    }
}
