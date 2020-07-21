//
//  TransactionCell.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit
import Eureka

// MARK: - TransactionCellState
struct TransactionCellState: Equatable {

    var id: Int?

    var account_id: Int?

    var amount: String?

    var vendor: String?

    var category: String?

    var date: String?
}

// MARK: - TransactionRow
final class TransactionRow: Row<TransactionCell>, RowType {

    required public init(tag: String?) {
        super.init(tag: tag)

        cellProvider = CellProvider<TransactionCell>(nibName: "TransactionCell")
    }
}

// MARK: - TransactionCell
final class TransactionCell: Cell<TransactionCellState>, CellType {
    
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var vendorLabel: UILabel!

    override func setup() {
        height = { 160.0 }
        super.setup()
    }

    override func update() {
        amountLabel.text = row.value?.amount
        categoryLabel.text = row.value?.category
        dateLabel.text = row.value?.date
        vendorLabel.text = row.value?.vendor
    }
}
