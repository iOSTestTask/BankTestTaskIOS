//
//  DashboardInteractor.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//
import PromiseKit
class DashboardInteractor {

    weak var output: DashboardInteractorOutput?

    var transactionAPIClient: APIClient<TransactionsAPI>!
    weak var timeFormatter: TimeFormatterService!
    weak var sortingService: TransactionsSortingService!

    // MARK: - Private properties
    var montlyCashExpenses: [MonthlyCashExpense]?
}

// MARK: - DashboardInteractorInput
extension DashboardInteractor: DashboardInteractorInput {

    func fetchCashExpenses() {
        getTransactions().done { [weak self] result in

            guard
                let group = self?.makeMonthlyCashExpenses(from: result) else { return }

            self?.montlyCashExpenses = group
            self?.output?.intercatorDidFetchCashExpenses(group)

        }.catch { [weak self] error in
            if let serverError = error as? APIError {
                switch serverError {
                case .cancelled: return
                default: self?.output?.interactorDidFailLoadCashExpenses(serverError.localizedDescription)
                }
            }
        }
    }

    func makeShortDateString(_ string: String?) -> String? {
        return timeFormatter.makeShortString(from: string)
    }

    func makeShortString(_ date: Date?) -> String? {
        guard
            let date = date else { return nil }
        return timeFormatter.makeShortMonthString(from: date)
    }
}

// MARK: - Private
// MARK: - Fetching data from server
private extension DashboardInteractor {

    func getTransactions() -> Promise<Transactions> {
        return transactionAPIClient.request(target: TransactionsAPI.fetch)
    }

    func makeMonthlyCashExpenses(from transactions: [Transaction]) -> [MonthlyCashExpense] {
        return transactions
            .group(by: { transaction in
                let originalDate = timeFormatter.makeDate(from: transaction.date) ?? Date()
                let components = Calendar.current.dateComponents([.year, .month], from: originalDate)
                let date = Calendar.current.date(from: components)!
                return date
            }).map { (date, transactions) -> MonthlyCashExpense in
                MonthlyCashExpense(
                    date: date,
                    cashGroups: makeCashExpenses(from: transactions))
            }
            .sorted(by: { $0.date.compare($1.date) == .orderedDescending })
    }

    func makeCashExpenses(from transactions: [Transaction]) -> [CashExpense] {
        return transactions
            .group(by: { $0.category })
            .map { (category, categoryTransactions) -> CashExpense in
                let amout = categoryTransactions
                    .compactMap(\.amount)
                    .compactMap { Double( $0.trimmingCharacters(in: .whitespaces )) }
                    .reduce(0, +)
                return CashExpense(
                    amount: amout,
                    category: category ?? .localized(.dashboardUnknownCategoryKey))
            }
    }
}
