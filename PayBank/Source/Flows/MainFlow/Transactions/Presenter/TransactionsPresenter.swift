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

    func viewOnLogoutTappedAction() {
        // FIXME: add logout on server
        output.transactionsModuleDidLogout()
    }
}

// MARK: - TransactionsInteractorOutput
extension TransactionsPresenter: TransactionsInteractorOutput {

    func intercatorDidFetchTransaction(_ transactions: [Transaction]) {
        let sectionsState = makeTransactionsSectionsState(transactions)
        view.setup(sectionsState)
    }

    func interactorDidFailLoadTransaction(_ errorDescription: String) {
        view.showOverNavigationBar(error: errorDescription)
    }
}

private extension TransactionsPresenter {
    func makeViewInitionalState() -> TransactionsViewControllerViewState {
        return TransactionsViewControllerViewState(navigationTitle: .localized(.transactionsNavigationTitle),
                                                   tabbarTitle: .localized(.transactionsTabbarTitle),
                                                   logoutButtonTitle: .localized(.transactionsLogoutButtonTitle))
    }

    func makeTransactionsSectionsState( _ transactions: [Transaction]) -> [TransactionsSectionState] {
        var sectionsStates = [TransactionsSectionState]()

        if transactions.isEmpty {
            sectionsStates.append(.data(.emptyResult(makeNoResultsCellState())))
        } else {
            sectionsStates.append(.data(.transactions(makeTransactionsCellState(transactions))))
        }

        return sectionsStates
    }

    func makeTransactionsCellState(_ transactions: [Transaction]) -> [TransactionCellState] {
        return transactions.map {
            let date = interactor.makeShortDateString($0.date)
            return TransactionCellState(id: $0.id,
                                        account_id: $0.accountId,
                                        amount: .localized(.transactionsAmount($0.amount ?? .localized(.noResultsInCell))),
                                        vendor: .localized(.transactionsVendor($0.vendor ?? .localized(.noResultsInCell))),
                                        category: .localized(.transactionsCategory($0.category ?? .localized(.noResultsInCell))),
                                        date: .localized(.transactionsDate(date ?? .localized(.noResultsInCell)))
            )
        }
    }

    func makeNoResultsCellState() -> NoResultCellState {
        return NoResultCellState(message: .localized(.noResults))
    }
}
