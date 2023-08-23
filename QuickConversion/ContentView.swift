//
//  ContentView.swift
//  QuickConversion
//
//  Created by Juan David Chaves Rodriguez on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var units: [String] = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Choose your length")
                    
                    Picker("Select your unit", selection: $units) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Text("hasta")
                }
            }
            .navigationTitle("LengthConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
