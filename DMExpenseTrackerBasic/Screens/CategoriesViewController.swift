//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTable: UITableView!
    

    @IBSegueAction func segueToExp(_ coder: NSCoder) -> ExpensesViewController? {
        let cell = categoryTable.cellForRow(at: categoryTable.indexPathForSelectedRow!)
        let selectedCategory = cell?.textLabel?.text ?? "?"
        print("User touched category: \(selectedCategory)")
        let expensesByCatagory = Expense.getExpensesByCategory(expenses: DataController.getExpenses())
        return ExpensesViewController(coder: coder, category: selectedCategory, expenses: expensesByCatagory[selectedCategory] ?? [])
    }
    
    var expenses = DataController.getExpenses()
    var expensesByCategory : [String:[Expense]] = [:]
    var categories : [String] = []
    
    func initializeExpenseData() {
        expensesByCategory = Expense.getExpensesByCategory(expenses: expenses)
        categories = [String](expensesByCategory.keys)
    }
    
    func configureTableView() {
        categoryTable.delegate = self
        categoryTable.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        initializeExpenseData()
        configureTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryReuseID, for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
}

