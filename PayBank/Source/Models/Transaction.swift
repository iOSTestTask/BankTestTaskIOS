//
//  Transaction.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

typealias Transactions = [Transaction]

struct Transaction: Codable, Equatable {

    var id: Int?

    var accountId: Int?

    var amount: String?

    var vendor: String?

    var category: String?

    var date: String?
}
