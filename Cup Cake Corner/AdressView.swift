//
//  AdressView.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/17/26.
//

import SwiftUI



struct AdressView: View {
    
    @Bindable var order: Order
    var body: some View {
        NavigationStack{
            Form{
                
                TextField("Name", text: $order.name)
                TextField("Enter your street adress ??", text: $order.street)
                TextField("Enter your city ??", text: $order.city)
                TextField("zip code", text: $order.zip)
                
                
                Section{
                    NavigationLink("Check Out"){
                        CheckOutView(order: order)
                        
                    }
                }.disabled(order.hasValidAdress == false)
            }.navigationTitle("Address details").navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    AdressView(order: Order())
}
