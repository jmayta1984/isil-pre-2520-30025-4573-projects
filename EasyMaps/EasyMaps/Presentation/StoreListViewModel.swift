//
//  StoreListViewModel.swift
//  EasyMaps
//
//  Created by Alumno on 21/11/25.
//

import Combine
import Foundation

class StoreListViewModel: ObservableObject {
    @Published var stores: [Store] = []
    let service = StoreService.shared
    
    
    private func getAllStores() {
        service.getAllStores { result in
            switch result {
            case .success(let stores):
                DispatchQueue.main.async {
                    self.stores = stores.map({ $0.toDomain() })
                }
            case .failure:
                break
                
            }
        }
    }
    
    init() {
        getAllStores()
    }
}
