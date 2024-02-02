//
//  Expense.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation

struct Expense {
    var title : String!
    var category: String!
    var amount: Double!
    
    static func calculateTotalSpent(expenses : [Expense]) -> Double {
        var sum = 0.0
        for expense in expenses {
            sum += expense.amount
        }
        return sum
    }
    
    static func getExpensesByCategory(expenses: [Expense]) -> [String: [Expense]] {
        var expensesMap : [String: [Expense]] = [:]
        for expense in expenses {
//            print("Expense category: \(expense.category) Expenses count: \(expenses.count)")
            if(expensesMap[expense.category] == nil){
                expensesMap.updateValue([expense], forKey: expense.category)
            } else {
                expensesMap[expense.category]?.append(expense)
            }
        }
        return expensesMap
    }
    
}


