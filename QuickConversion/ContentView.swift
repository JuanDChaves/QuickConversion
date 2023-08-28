//
//  ContentView.swift
//  QuickConversion
//
//  Created by Juan David Chaves Rodriguez on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var units: [String] = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    @State private var length: Double = 0.0
    @State private var result: Double = 0.0
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", value: $length, format: .number)
                    
                    Picker("Select a Unit", selection: $units) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Picker("Convert to", selection: $units) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    Text("Result")
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
