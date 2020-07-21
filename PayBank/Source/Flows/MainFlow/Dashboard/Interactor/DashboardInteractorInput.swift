//
//  DashboardInteractorInput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

protocol DashboardInteractorInput {

    func fetchCashExpenses()

    func makeShortDateString(_ string: String?) -> String?

    func makeShortString(_ date: Date?) -> String?
}
