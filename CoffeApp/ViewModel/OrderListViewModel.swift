//
//  OrderListViewModel.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import Foundation


class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrder()
    }
    
    
    func fetchOrder() {
        
        Service().getAllOrder { orders in
            if let orders = orders  {
                self.orders = orders.map(OrderViewModel.init)
            }
            
            
        }
    }
    
    
}


class OrderViewModel: Identifiable {
    
    let id = UUID()
    
    var order: OrderModel
    
    init(order: OrderModel) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeName: String {
        return self.order.coffeeName
    }
    
    var total: Double {
        return self.order.total
    }
    
}
