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
                
                Section("How many you desire today??"){
                    HStack{
                        Image(systemName: "birthday.cake.fill").foregroundStyle(.pink)
                            Text("order").font(.headline)
                            Text("\(order.quantity) cupcakes").font(.subheadline).foregroundColor(.primary)
                        
                        Spacer()
                        Stepper("Number of cakes You want ?? ", value: $order.quantity, in: 2...20, step: 1 ).labelsHidden()
                    }
                }
                
                Section{
                    Toggle("any special requests", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled{
                        Toggle("do you want an add sprinkles??", isOn: $order.addSprinkles )
                        Toggle("do you want extra frosting ??", isOn: $order.extraFrosting)
                    }
                }
                
                Section{
                    NavigationLink("Adress"){
                        AdressView(order: order)
                    }
                }
            }.navigationTitle("cupcake").navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    ContentView()
}
