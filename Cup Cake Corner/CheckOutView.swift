//
//  CheckOutView.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/18/26.
//

import SwiftUI

struct CheckOutView: View {
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var order : Order
    var body: some View {
        
            ScrollView{
                VStack{
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")){image in
                        image.resizable().scaledToFit()
                    }placeholder : {
                        ProgressView()
                    }.frame(height: 233)
                    
                    Text("Your total is \(order.cost, format: .currency(code: "USD"))").font(.title)
                    
                    Button("place order"){
                        Task{
                            await placeOrder()
                        }
                    }
                        .padding()
                }
            }.navigationTitle("Check Out").navigationBarTitleDisplayMode(.inline)
                .alert("Thankyou", isPresented: $showingConfirmation){
                    Button("O"){}
                } message: {
                    Text(confirmationMessage)
                }
                .alert("Sorry", isPresented: $showingConfirmation){
                    Button("OK"){}
                } message: {
                    Text(confirmationTitle)
                }
        }

    
    func placeOrder() async{
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("failed to encode order")
            
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url:url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let(data,_) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            
            confirmationMessage = "Your order for \(decodedOrder.quantity) * \(Order.types[decodedOrder.type].lowercased()) is on its way"
            showingConfirmation = true
        }catch{
            confirmationTitle = "delivery failed due to network issues"
            showingConfirmation = true
            print("checkout failed: \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    CheckOutView(order: Order())
}
