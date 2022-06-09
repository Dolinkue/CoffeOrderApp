//
//  AddCoffeeViewModel.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 09/06/2022.
//

import Foundation


class AddCoffeeViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webservice: Service
    
    var coffeeList: [CoffeeViewModel] {
        return CoffeModel.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webservice = Service()
    }
    
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = OrderModel(name: self.name, coffeeName: self.coffeeName, size: self.size, total: self.total)
        
        
        self.webservice.createCoffeeOrder(order: order) { _ in
            
        }
        
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
    
    
    private func calculateTotalPrice() -> Double {
        let coffeVM = coffeeList.first {$0.name == coffeeName}
        if let coffeVM = coffeVM {
            return coffeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
}
