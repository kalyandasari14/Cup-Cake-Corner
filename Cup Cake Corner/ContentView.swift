//
//  ContentView.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/15/26.
//
import CoreHaptics
import SwiftUI


struct Response:Codable{
    var results: [Result]
}

struct Result: Codable{
    var trackId : Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    @State private var username = ""
    @State private var email = ""
    @State private var engine: CHHapticEngine?
    var body: some View {
        
        Form{
            Section{
                TextField("userfield", text: $username)
                TextField("enter your mail", text: $email)}
            Section{
                Button("create account"){
                    print("creating account")
                }
            }.disabled(username .isEmpty || email.isEmpty)
        }
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){phase in
            if let image = phase.image{
                image.resizable().scaledToFit()
            }else if phase.error != nil{
               Text("there is no image")
            }else{
                ProgressView()
            }}
            .frame(width: 200,height: 200)
        
        List(results, id: \.trackId){item in
            VStack(alignment: .leading){
                Text(item.trackName).font(.headline)
                Text(item.collectionName)
            }
        }.task {
            await loadData()
        }
    }
    
    func loadData() async{
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do{
            let(data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
            }
        } catch{
            print("invalid data")
        }
        
       
        
    }
}

#Preview {
    ContentView()
}
