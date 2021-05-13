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
    var result: String = ""
    var conversionList = ["meters", "KM", "feet", "yard", "miles"]
    
    var body: some View {
        NavigationView {
            Form {
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
                    TextField("Enter \(conversionList[inputUnit])", text: $inputUnitValue)
                }
                
                Section {
                    Text("\(inputUnitValue) \(conversionList[inputUnit]) is equal to \(result) \(conversionList[outputUnit])")
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
