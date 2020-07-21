//
//  NoResultsCell.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit
import Eureka

// MARK: - NoResultCellState
struct NoResultCellState: Equatable {

    var message: String?
}

// MARK: - NoResultRow
final class NoResultRow: Row<NoResultsCell>, RowType {

    required public init(tag: String?) {
        super.init(tag: tag)

        cellProvider = CellProvider<NoResultsCell>(nibName: "NoResultsCell")
    }
}

// MARK: - NoResultsCell
class NoResultsCell: Cell<NoResultCellState>, CellType {

    @IBOutlet private weak var messageLabel: UILabel!

    // MARK: - Life cylce
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Cell
    override func setup() {
        height = { 50.0 }
        super.setup()
    }

    override func update() {
        messageLabel.text = row.value?.message
    }
}
