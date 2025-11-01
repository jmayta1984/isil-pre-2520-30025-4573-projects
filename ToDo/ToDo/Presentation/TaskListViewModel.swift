//
//  TaskListViewModel.swift
//  ToDo
//
//  Created by Alumno on 31/10/25.
//

import Combine
import Foundation

class TaskListViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    let productDao = ProductDao.shared
    
    func addTask(task: Task) {
        productDao.insertTask(task: task)
        fetchAll()
    }
    
    func deleteTask(task: Task) {
        productDao.deleteTask(task: task)
        fetchAll()
    }
    
    func updateTask(task: Task) {
        productDao.updateTask(task: task)
        fetchAll()
        
    }
    
    func fetchAll() {
        tasks = productDao.fetchAll()
    }
    
    init() {
        fetchAll()
    }
    
}


