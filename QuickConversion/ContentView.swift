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
    @FocusState private var inputLengthIsFocused: Bool
    
    let units: [String]  = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var normalizedEnteredValue: Double {
        var normalizedValue: Double = 0.0
        
        switch selectedOriginalUnits {
        case "Meters":
            normalizedValue = inputLength
        case "Kilometers":
            normalizedValue = inputLength * 100
        case "Feet":
            normalizedValue = inputLength * 0.3048
        case "Yards":
            normalizedValue = inputLength * 0.9144
        case "Miles":
            normalizedValue = inputLength * 1609
        default:
            print("default")
        }
        
        return normalizedValue
    }
    
    var finalConvertedValue: Double {
        var convertedValue: Double = normalizedEnteredValue
        
        switch selectedNewUnits {
        case "Meters":
            convertedValue = convertedValue * 1
        case "Kilometers":
            convertedValue = convertedValue / 100
        case "Feet":
            convertedValue = convertedValue / 0.3048
        case "Yards":
            convertedValue = convertedValue / 0.9144
        case "Miles":
            convertedValue = convertedValue / 1609
        default:
            print("default")
        }
        
        return convertedValue
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Length", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputLengthIsFocused)
                    
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
                    
                    Text(finalConvertedValue, format: .number)
                } header: {
                    Text("To:")
                }
            }
            .navigationTitle("LengthConversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputLengthIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
