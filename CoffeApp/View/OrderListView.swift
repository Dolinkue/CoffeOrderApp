//
//  OrderListView.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            
            
            ForEach(self.orders, id:\.id) { order in
                HStack {
                    
                    Image(order.coffeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(30)
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeName)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.gray)
                                .cornerRadius(10)
                            
                            Text(order.size)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                    }
                    
                    
                }
            }
            
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: OrderModel(name: "Nico", coffeeName: "Regular", size: "Regular", total: 1.0))])
    }
}
