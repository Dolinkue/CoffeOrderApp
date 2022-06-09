//
//  CoffeeViewModel.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 09/06/2022.
//

import Foundation


class CoffeListViewModel {
    var coffeList: [CoffeeViewModel] = [CoffeeViewModel]()
    
}

struct CoffeeViewModel {
    
    var coffee: CoffeModel
    
    init(coffee: CoffeModel) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageUrl: String {
        return self.coffee.imageUrl
    }
    
    var price: Double {
        return self.coffee.price
    }
    
}
