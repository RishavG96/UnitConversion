//
//  ContentView.swift
//  UnitConversion
//
//  Created by Rishav Gupta on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit: String = "seconds"
    @State private var outputUnit: String = "minutes"
    @State private var timeEntered: Double = 0.0
    @FocusState private var timeIsFocused: Bool
    
    private let timeMetrics = ["seconds", "minutes", "hours", "days"]
    
    var convertedTimeIs: Double {
        print("value is \(timeEntered)")
        if timeEntered == 0 {
            return 0
        }
        if inputUnit == "seconds" {
            switch outputUnit {
            case "seconds":
                return timeEntered
            case "minutes":
                return timeEntered / 60
            case "hours":
                return timeEntered / (60 * 60)
            case "days":
                return timeEntered / (60 * 60 * 24)
            default:
                break
            }
        } else if inputUnit == "minutes" {
            switch outputUnit {
            case "seconds":
                return timeEntered * 60
            case "minutes":
                return timeEntered
            case "hours":
                return timeEntered / 60
            case "days":
                return timeEntered / (60 * 24)
            default:
                break
            }
        } else if inputUnit == "hours" {
            switch outputUnit {
            case "seconds":
                return timeEntered * 60 * 60
            case "minutes":
                return timeEntered * 60
            case "hours":
                return timeEntered
            case "days":
                return timeEntered / 24
            default:
                break
            }
        } else if inputUnit == "days" {
            switch outputUnit {
            case "seconds":
                return timeEntered * 60 * 60 * 24
            case "minutes":
                return timeEntered * 60 * 24
            case "hours":
                return timeEntered * 24
            case "days":
                return timeEntered
            default:
                break
            }
        }
        
        return 0
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Select Input Unit", selection: $inputUnit) {
                    ForEach(timeMetrics, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Select Input Parameter")
            }
            
            Section {
                Picker("Select Output Unit", selection: $outputUnit) {
                    ForEach(timeMetrics, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Select Output Parameter")
            }
            
            Section {
                TextField("Enter time in \(inputUnit)", value: $timeEntered, format: .number)
                    .keyboardType(.numberPad)
                    .focused($timeIsFocused)
            } header: {
                Text("Enter time in \(inputUnit)")
            }
            
            Section {
                Text("Calculated time is \(convertedTimeIs, specifier: "%.2f") in \(outputUnit)")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    timeIsFocused = false
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
