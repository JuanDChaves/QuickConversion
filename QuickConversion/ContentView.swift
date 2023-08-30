//
//  ContentView.swift
//  QuickConversion
//
//  Created by Juan David Chaves Rodriguez on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOriginalUnits: String = "Meters"
    @State private var selectedNewUnits: String = "Meters"
    @State private var inputLength: Double = 0.0
    @State private var result: Double = 0.0
    
    let units: [String]  = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var normalizedSelectedUnit: Double {
        var normalizedUnit: Double = 0.0
        switch selectedOriginalUnits {
        case "Meters":
            normalizedUnit = inputLength
        case "Kilometers":
            normalizedUnit = inputLength * 100
        case "Feet":
            normalizedUnit = inputLength * 0.3048
        case "Yards":
            normalizedUnit = inputLength * 0.9144
        case "Miles":
            normalizedUnit = inputLength * 1609
        default:
            print("default")
        }
        
        if selectedNewUnits == "Meters" {
            normalizedUnit = inputLength
        } else {
        }
        return normalizedUnit
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Select a Unit", selection: $selectedOriginalUnits) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert:")
                }
                Section {

                }
                Section {
                    Picker("Convert to", selection: $selectedNewUnits) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(inputLength, format: .number)
                } header: {
                    Text("To:")
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
