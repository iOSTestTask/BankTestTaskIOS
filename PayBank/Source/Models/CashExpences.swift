//
//  CashExpences.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct CashExpense {

    var amount: Double

    var category: String
}

struct MonthlyCashExpense {

    var date: Date

    var cashGroups: [CashExpense]
}
