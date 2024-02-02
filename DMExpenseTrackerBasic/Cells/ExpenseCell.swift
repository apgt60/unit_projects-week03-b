//
//  ExpenseCell.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpenseCell: UITableViewCell {
    
    @IBOutlet weak var expenseBubble: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    
    func set(expense: Expense) {
        title.text = "\(expense.title!)"
        amount.text =  "$\(expense.amount!)"
    }

    
// Code below was auto-generated when the nib was created.  Was commented out because it wasn't needed.

//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
}
