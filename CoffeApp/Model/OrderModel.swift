//
//  OrderModel.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import Foundation


struct OrderModel: Codable {
    
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
    
}
