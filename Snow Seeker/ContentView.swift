//
//  ContentView.swift
//  Snow Seeker
//
//  Created by Aarish on 28/05/22.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            List(filteredResorts){ resort in
                NavigationLink{
                    ResortView(resort: resort)
                }label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading){
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            WelcomeView()
        }
    }
    var filteredResorts: [Resort]{
        if searchText.isEmpty {
            return resorts
        }else{
            return resorts.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
