//
//  ContentView.swift
//  Cup Cake Corner
//
//  Created by kalyan on 2/15/26.
//

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
    var body: some View {
        
        List(results, id: \.trackId){item in
            VStack(alignment: .leading){
                Text(item.trackName).font(.headline)
                Text(item.collectionName)
            }
        }
    }
}

#Preview {
    ContentView()
}
