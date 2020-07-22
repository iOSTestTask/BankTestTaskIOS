//
//  Transaction.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

typealias Transactions = [Transaction]

struct Transaction: Codable {

    var id: Int?

    var accountId: Int?

    var amount: String?

    var vendor: String?

    var category: String?

    var date: String?
}

// MARK: - Equatable
extension Transaction: Equatable {
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.accountId == rhs.accountId &&
            lhs.amount == rhs.amount &&
            lhs.category == rhs.category &&
            lhs.vendor == rhs.vendor &&
            lhs.date == rhs.date
    }
}
