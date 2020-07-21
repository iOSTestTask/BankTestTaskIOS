//
//  TransactionsInteractor.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import PromiseKit
class TransactionsInteractor {

    // MARK: - Public properties
    weak var output: TransactionsInteractorOutput?
    var transactionAPIClient: APIClient<TransactionsAPI>!

    // MARK: - Private properties
    var transactions: [Transaction]?
}

// MARK: - TransactionsInteractorInput
extension TransactionsInteractor: TransactionsInteractorInput {

    func fetchTransactions() {
        getTransactions().done { [weak self] result in
            self?.transactions = result
            self?.output?.intercatorDidFetchTransaction(result)
        }.catch { [weak self] error in
            if let serverError = error as? APIError {
                switch serverError {
                case .cancelled: return
                default: self?.output?.interactorDidFailLoadTransaction(serverError.localizedDescription)
                }
            }
        }
    }
}

// MARK: - Private
// MARK: - Fetching data from server
private extension TransactionsInteractor {

    func getTransactions() -> Promise<Transactions> {
        return transactionAPIClient.request(target: TransactionsAPI.fetch)
    }
}
