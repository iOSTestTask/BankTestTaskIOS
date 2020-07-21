//
//  TransacrtionsStates.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct TransactionsViewControllerViewState {

    var navigationTitle: String?

    var tabbarTitle: String?
}

enum TransactionsSectionState {

    case data(TransactionDataSectionState)
}

enum TransactionDataSectionState {

    case transactions([TransactionCellState])

    case emptyResult(NoResultCellState)
}
