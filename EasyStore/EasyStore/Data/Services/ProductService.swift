//
//  ProductService.swift
//  EasyStore
//
//  Created by Alumno on 3/10/25.
//

import Foundation

class ProductService {
    
    static let shared = ProductService()
    
    private init(){}
    
    func getAllProducts(completion: @escaping ([Product]?, String? ) -> Void ) {
        
        let urlString = "https://dummyjson.com/products"
        guard let url = URL(string: urlString) else {
            completion(nil, "Error: wrong URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, "Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: HTTP request failed")
                return
            }
            
            do {
                
                let wrapperDto = try JSONDecoder().decode(ProductsWrapperDto.self, from: data)
                let products = wrapperDto.products.map { productDto in
                    Product(id: productDto.id,
                            title: productDto.title,
                            description: productDto.description,
                            thumbnail: productDto.thumbnail)
                }
                completion(products, nil)
                
            } catch (let error) {
                completion(nil, "Error: \(error.localizedDescription)")
            }
            
        }
        
        task.resume()
        
    }
}
