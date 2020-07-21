//
//  Transaction.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import ObjectMapper

typealias Transactions = [Transaction]

struct Transaction: Codable {

    var id: Int?

    var accountId: Int?

    var amount: String?

    var vendor: String?

    var category: String?

    var date: String?

    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case vendor
        case category
        case date
    }
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
