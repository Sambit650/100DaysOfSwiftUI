//
//  Conversion.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 12/05/21.
//

import SwiftUI

struct Conversion: View {
    
    // MARK:- Properties
    
    @State private var inputUnitValue: String = ""
    @State private var inputUnit:Int = 0
    @State private var outputUnit:Int = 1
    var conversionList = ["meters", "KM", "feet", "yards", "miles"]
    
    enum Unit: String, CaseIterable {
        case meters
        case km
        case feet
        case yards
        case miles
        
        var unitLength: UnitLength {
            switch self {
            case .meters: return UnitLength.meters
            case .km: return UnitLength.kilometers
            case .feet: return UnitLength.feet
            case .yards: return UnitLength.yards
            case .miles: return UnitLength.miles
            }
        }
    }
    
    let lengthUnits = Unit
        .allCases
        .compactMap { $0.rawValue }
    
    var output: Double {
        guard let input = Double(self.inputUnitValue) else {
            return 0
        }
        guard let inputUnit = Unit(rawValue: lengthUnits[self.inputUnit]) else {
            return 0
        }
        guard let outputUnit = Unit(rawValue: lengthUnits[self.outputUnit]) else {
            return 0
        }
        return Measurement(value: input, unit: inputUnit.unitLength).converted(to: outputUnit.unitLength).value
    }
    
    // MARK:- Views
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter \(conversionList[inputUnit])", text: $inputUnitValue)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Choose the Input unit type.")) {
                    Picker("Select type of conversion", selection: $inputUnit) {
                        ForEach(0 ..< conversionList.count) {
                            Text("\(conversionList[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose the Output unit type.")) {
                    Picker("Select type of conversion", selection: $outputUnit) {
                        ForEach(0 ..< conversionList.count) {
                            Text("\(conversionList[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(inputUnitValue.isEmpty ? "0" : inputUnitValue) \(conversionList[inputUnit]) is equal to \(output) \(conversionList[outputUnit])")
                }
            }
            .navigationBarTitle("Conversion", displayMode: .automatic)
        }
    }
}

struct Conversion_Previews: PreviewProvider {
    static var previews: some View {
        Conversion()
    }
}
