//
//  OrderTotalView.swift
//  CoffeApp
//
//  Created by Nicolas Dolinkue on 12/06/2022.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center){
            Spacer()
            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding()
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
