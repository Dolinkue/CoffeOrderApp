//
//  ContentView.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    
   
    @ObservedObject private var orderListView = OrderListViewModel()
    
    
    var body: some View {
        
        NavigationView {
        
        OrderListView(orders: self.orderListView.orders)
    
                .navigationTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
