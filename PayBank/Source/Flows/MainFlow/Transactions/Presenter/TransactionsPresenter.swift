//
//  TransactionsPresenter.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

class TransactionsPresenter {

    weak var view: TransactionsViewInput!
    var interactor: TransactionsInteractorInput!
    var router: TransactionsRouterInput!
    weak var output: TransactionsModuleOutput!
}

// MARK: - TransactionsModuleInput
extension TransactionsPresenter: TransactionsModuleInput {}

// MARK: - TransactionsViewOutput
extension TransactionsPresenter: TransactionsViewOutput {

    func viewIsReady() {

        // setup view with initional data
        let viewInitionalState = makeViewInitionalState()
        view.setupInitialState(viewInitionalState)

        // fetch data
        interactor.fetchTransactions()
    }
}

// MARK: - TransactionsInteractorOutput
extension TransactionsPresenter: TransactionsInteractorOutput {

    func intercatorDidFetchTransaction(_ transactions: [Transaction]) {
        
    }

    func interactorDidFailLoadTransaction(_ errorDescription: String) {

    }
}

private extension TransactionsPresenter {
    func makeViewInitionalState() -> TransactionsViewControllerViewState {
        return TransactionsViewControllerViewState(navigationTitle: .localized(.transactionsNavigationTitle),
                                                   tabbarTitle: .localized(.transactionsTabbarTitle))
    }

    func makeTransactionsState( _ transactions: [Transaction]) {

    }
}
