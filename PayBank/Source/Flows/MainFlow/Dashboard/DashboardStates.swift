//
//  DashboardStates.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct DashboardViewControllerViewState {

    var navigationTitle: String?

    var tabbarTitle: String?
}

struct DashoboardCashExpencesSectionState {

    var title: String?

    var items: [MontlyCashExpensesCellState]
}

enum DashboardDataSectionState {

    case emptyResult(NoResultCellState)

    case cashExpences(DashoboardCashExpencesSectionState)
}
