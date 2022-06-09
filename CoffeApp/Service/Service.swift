//
//  Service.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import Foundation


struct Service {
    
    
    func createCoffeeOrder (order: OrderModel, completion: @escaping(CreateOrderResponse) -> ()) {
        // para hacer el Post
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {return}
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
          
            guard let data = data, error == nil  else {
                
                return
            }

            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            
            DispatchQueue.main.async {
                completion(createOrderResponse!)
            }
            
            
            
        }.resume()
        
        
    }
    
    
    
    func getAllOrder(completion: @escaping([OrderModel]?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                
                let order = try JSONDecoder().decode([OrderModel].self, from: data)
                
                DispatchQueue.main.async {
                    
                    print(order)
                    completion(order)
                    
                    
                }
                
                
            } catch {
                
                let error = error
                print(error)
                
                
            }
            
        }.resume()
    }
}
