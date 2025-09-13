//
//  Product.swift
//  EasyShop
//
//  Created by Alumno on 12/09/25.
//

struct Product: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}

let products = [
    Product(id: 1,
            name: "Nike React Infinity Run Flyknit",
            price: 180,
            image: "https://www.fit2run.com/cdn/shop/files/DH5392-007-PHSRH001-1500.png"),
    Product(id: 2,
            name: "Nike React Miler",
            price: 140,
            image: "https://i.ebayimg.com/images/g/SoIAAOSwEXpmIQ~7/s-l400.png"),
    Product(id: 3,
            name: "Nike Air Zoom Pegasus 37",
            price: 120,
            image: "https://d2cva83hdk3bwc.cloudfront.net/nike-air-zoom-pegasus-37-white-cyber-1.jpg"),
]
