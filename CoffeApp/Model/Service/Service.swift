//
//  Service.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 08/06/2022.
//

import Foundation


struct Service {
    
    
    
    func getAllOrder(completion: @escaping([OrderModel]?) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                
                let order = try JSONDecoder().decode([OrderModel].self, from: data)
                DispatchQueue.main.async {
                    
                    
                    completion(order)
                    
                }
                
                
            } catch {
                
                let error = error.localizedDescription
                print(error)
                
                
            }
            
        }.resume()
    }
}
