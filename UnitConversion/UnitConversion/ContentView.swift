//
//  ContentView.swift
//  UnitConversion
//
//  Created by Jimmy Lynch on 2/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value: Double = 0.0
    @State private var startingUnit: String = "foot"
    @State private var endingUnit: String = "foot"
    private var options = ["cm", "in", "foot", "yard", "meter"]
    
    private var output: Double {
        var initialToBase: Double = 0.0
        var baseToOutput: Double = 0.0
        
        switch startingUnit {
            case "cm":
                initialToBase = value
            case "in":
                initialToBase = value * 2.54
            case "foot":
                initialToBase = value * 30.48
            case "yard":
                initialToBase = value * 91.44
            case "meter":
                initialToBase = value * 100
            default:
                initialToBase = value
        }
        
        switch endingUnit {
            case "cm":
                baseToOutput = initialToBase
            case "in":
                baseToOutput = initialToBase / 2.54
            case "foot":
                baseToOutput = initialToBase / 30.48
            case "yard":
                baseToOutput = initialToBase / 91.44
            case "meter":
                baseToOutput = initialToBase / 100
            
            default:
                baseToOutput = initialToBase
        }
        return baseToOutput
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $value, format: .number)
                } header: {
                    Text("Value to Convert.")
                }
                
                Section {
                    Picker("initial unit", selection: $startingUnit) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Initial Unit")
                }
                
                Section {
                    Picker("output unit", selection: $endingUnit) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                
                Section {
                    Text("\(output)")
                } header: {
                    Text("Converted value.")
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
