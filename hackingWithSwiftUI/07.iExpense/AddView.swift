//
//  AddView.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 06/06/21.
//

import SwiftUI

struct AddView: View {
    
    // MARK:- Properties
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expense: Expenses
    @State private var expenseName: String = ""
    @State private var expenseAmount: String = ""
    @State private var expenseType: String = ""
    @State private var isAlertShowing: Bool = false
    
    static let types = ["Business", "Personal"]
    
    // MARK:- Views
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Expense Name", text: $expenseName)
                
                Picker("Expense type", selection: $expenseType) {
                    ForEach(AddView.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Expense Value", text: $expenseAmount)
                    .keyboardType(.numberPad)
                    
                    .navigationBarItems(
                        trailing:
                            Button("Add") {
                                if let enteredAmount = Double(expenseAmount) {
                                    let item = ExpenseItem(name: expenseName,
                                                           amount: enteredAmount,
                                                           type: expenseType)
                                    expense.items.append(item)
                                    self.presentationMode.wrappedValue.dismiss()
                                } else {
                                    isAlertShowing = true
                                }
                            }
                    )
            }
            .alert(isPresented: $isAlertShowing) {
                Alert(title: Text("Error"), message: Text("Please enter a valid amount"), dismissButton: .default(Text("Continue")))
            }
        }
    }
}

// MARK:- PreViews

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expenses())
    }
}
