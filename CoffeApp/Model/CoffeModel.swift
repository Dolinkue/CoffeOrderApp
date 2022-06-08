//
//  CoffeModel.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import Foundation


struct CoffeModel {
    
    let name: String
    let imageUrl: String
    let price: Double
    
}


extension CoffeModel {
    
    static func all() -> [CoffeModel] {
        
        return [
        
            CoffeModel(name: "Cappuccino", imageUrl: "Cappuccino", price: 2.5),
            CoffeModel(name: "Espresso", imageUrl: "Espresso", price: 2.1),
            CoffeModel(name: "Regular", imageUrl: "Regular", price: 1.0)
        ]
        
    }
    
}
