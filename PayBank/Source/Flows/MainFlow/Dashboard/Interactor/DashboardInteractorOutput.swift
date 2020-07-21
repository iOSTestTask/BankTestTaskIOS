//
//  DashboardInteractorOutput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

protocol DashboardInteractorOutput: class {

    func intercatorDidFetchCashExpenses(_ cashExpencses: [MonthlyCashExpense])

    func interactorDidFailLoadCashExpenses(_ errorDescription: String)
}
