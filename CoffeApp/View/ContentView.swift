//
//  ContentView.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import SwiftUI

struct ContentView: View {
    
   
    @ObservedObject private var orderListView = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
        
        OrderListView(orders: self.orderListView.orders)
    
                .navigationTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.blue)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.blue)
                })
            
                .sheet(isPresented: self.$showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }
    }
    
    private func reloadOrders() {
        self.orderListView.fetchOrder()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
