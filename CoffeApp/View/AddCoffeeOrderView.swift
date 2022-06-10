//
//  AddCoffeeOrderView.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 10/06/2022.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
            
                Form {
                    
                    Section {
                        TextField("enter name", text: self.$addCoffeeOrderVM.name)
                    } header: {
                        Text("INFORMATION")
                    }
                    
                    Section {
                        ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
                            
                            
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    } header: {
                        Text("SELECT COFFEE").font(.body)
                    }
                    
                    
                    Section(header:
                        Text("SELECT COFFE").font(.body)) {
                        
                            Picker("", selection: self.$addCoffeeOrderVM.size) {
                                Text("Small").tag("Small")
                                Text("Medium").tag("Medium")
                                Text("Large").tag("Large")
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                }
                
                Button("Place Order") {
                    
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
                
            }
            .navigationTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            
            Image(coffee.imageUrl)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            
            Text(coffee.name)
                .font(.title)
                .padding(.leading)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = self.coffee.name
            
        }
    }
}
