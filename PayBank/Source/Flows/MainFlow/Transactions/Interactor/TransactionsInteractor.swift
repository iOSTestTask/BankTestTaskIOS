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
    weak var timeFormatter: TimeFormatterService!
    weak var sortingService: SortingService!

    // MARK: - Private properties
    var transactions: [Transaction]?
}

// MARK: - TransactionsInteractorInput
extension TransactionsInteractor: TransactionsInteractorInput {

    func fetchTransactions() {
        getTransactions().done { [weak self] result in
            let sorted = self?.sortingService.sort(result)
            self?.transactions = sorted
            self?.output?.intercatorDidFetchTransaction(sorted ?? [])
        }.catch { [weak self] error in
            if let serverError = error as? APIError {
                switch serverError {
                case .cancelled: return
                default: self?.output?.interactorDidFailLoadTransaction(serverError.localizedDescription)
                }
            }
        }
    }

    func makeShortDateString(_ string: String?) -> String? {
        return timeFormatter.makeShortString(from: string)
    }
}

// MARK: - Private
// MARK: - Fetching data from server
private extension TransactionsInteractor {

    func getTransactions() -> Promise<Transactions> {
        return transactionAPIClient.request(target: TransactionsAPI.fetch)
    }
}
