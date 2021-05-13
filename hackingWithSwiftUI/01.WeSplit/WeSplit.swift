//
//  WeSplit.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 12/05/21.
//

import SwiftUI

struct WeSplit: View {
    
    // MARK:- Properties
    
    @State private var chequeAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var selectedTipPercent: Int = 2
    private var tipList = [0, 5, 10, 15, 20, 25]
    
    // MARK:- Views
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Enter cheque amount", text: $chequeAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percent", selection: $selectedTipPercent) {
                        ForEach(0 ..< tipList.count) {
                            Text("\(tipList[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Cheque Details")) {
                    Text("Cheque Amount is ₹\(chequeAmount)")
                    Text("Tip is \(tipList[selectedTipPercent])%")
                    Text("To be split among \(numberOfPeople + 2) people")
                }
                
                Section(header: Text("Amount Per Person")) {
                    Text("₹\(amountPerPerson, specifier: "%0.2f")")
                }
            }
            .navigationBarTitle("WeSplit", displayMode: .large)
        }
    }
    
    // MARK:- Methods
    
    private var amountPerPerson: Double {
        guard let total = Double(chequeAmount) else { return 0.0 }
        let tip: Double = total / 100 * Double(tipList[selectedTipPercent])
        let totalPeople: Double = Double(numberOfPeople + 2)
        return (total + tip) / totalPeople
    }
}

// MARK:- PreView

struct WeSplit_Previews: PreviewProvider {
    static var previews: some View {
        WeSplit()
    }
}
