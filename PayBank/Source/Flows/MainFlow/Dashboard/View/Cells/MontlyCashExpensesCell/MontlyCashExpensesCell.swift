//
//  MontlyCashExpensesCell.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit
import Eureka

// MARK: - MontlyCashExpensesCellState
struct MontlyCashExpensesCellState: Equatable {

    var amount: String?

    var category: String?
}

// MARK: - MontlyCashExpensesRow
final class MontlyCashExpensesRow: Row<MontlyCashExpensesCell>, RowType {

    required public init(tag: String?) {
        super.init(tag: tag)

        cellProvider = CellProvider<MontlyCashExpensesCell>(nibName: "MontlyCashExpensesCell")
    }
}

// MARK: - MontlyCashExpensesCell
final class MontlyCashExpensesCell: Cell<MontlyCashExpensesCellState>, CellType {

    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!

    override func setup() {
        height = { 60.0 }
        super.setup()
    }

    override func update() {
        amountLabel.text = row.value?.amount
        categoryLabel.text = row.value?.category
    }
}
