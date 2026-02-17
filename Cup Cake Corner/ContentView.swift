//
//  ContentView.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/15/26.
//
import SwiftUI




struct ContentView: View {
    
    @State private var order = Order()
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Pick the type of cake you want ??", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }.pickerStyle(.navigationLink)
                    
                }
                
                Section{
                    HStack{
                        Text("Quantity: \(order.quantity)")
                        Spacer()
                        Stepper("Number of cakes You want ?? ", value: $order.quantity, in: 2...20, step: 1 ).labelsHidden()
                    }
                }
            }.navigationTitle("cupcake").navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    ContentView()
}
