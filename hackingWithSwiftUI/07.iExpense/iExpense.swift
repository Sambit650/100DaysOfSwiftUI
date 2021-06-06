//
//  iExpense.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 06/06/21.
//

import SwiftUI

// MARK:- ExpenseItem

struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var amount: Double
    var type: String
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "expenses")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "expenses") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct iExpense: View {
    
    // MARK:- Properties
    
    @ObservedObject private var expenses: Expenses = Expenses()
    @State private var isAddExpenseVisible: Bool = false
    
    // MARK:- Views
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text("$\(item.amount, specifier: "%g")")
                    }
                }
                .onDelete(perform: deleteExpense)
            }
            .listStyle(GroupedListStyle())
            
            .navigationBarTitle("iExpense", displayMode: .automatic)
            .navigationBarItems(trailing:
                                    Button(action: { isAddExpenseVisible = true }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
        .sheet(isPresented: $isAddExpenseVisible) { AddView(expense: self.expenses) }
    }
    
    // MARK:- Delete Method
    
    private func deleteExpense(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

// MARK:- Previews

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        iExpense()
    }
}
