//
//  TransactionsViewInput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

protocol TransactionsViewInput: class {

    func setupInitialState(_ viewState: TransactionsViewControllerViewState)

    func setup(_ sectionsState: [TransactionsSectionState])

    func showOverNavigationBar(error: String)
}
