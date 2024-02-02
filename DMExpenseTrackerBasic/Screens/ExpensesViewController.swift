//
//  ExpensesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
  
    var category : String = ""
    var expenses : [Expense] = []
    
    init?(coder: NSCoder, category: String, expenses: [Expense]) {
        self.category = category
        self.expenses = expenses
        
//        print("category:\(category) expenses:\(expenses)")
        
        let totalCategorySpend = Expense.calculateTotalSpent(expenses: self.expenses)
        
        super.init(coder: coder)
        
        self.title = "You spent $\(totalCategorySpend) on \(self.category)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureViewController() {
        tableView.delegate = self
        tableView.dataSource = self
        //register custom Nib for table view
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.expenseReuseID, for: indexPath) as! ExpenseCell
        cell.set(expense: expenses[indexPath.row])
        return cell
    }
    
}
