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
    weak var sortingService: SortingService!

    // MARK: - Private properties
    var montlyCashExpenses: [MonthlyCashExpense]?
}

// MARK: - DashboardInteractorInput
extension DashboardInteractor: DashboardInteractorInput {

    func fetchCashExpenses() {
        getTransactions().done { [weak self] result in

            guard
                let group = self?.groupTransactionsByCategories(result) else { return }

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

    func groupTransactionsByMonth(_ transactions: [Transaction]) -> [Date: [Transaction]] {
        let empty: [Date: [Transaction]] = [:]

        return transactions.reduce(into: empty) { values, transaction in

            let originalDate = timeFormatter.makeDate(from: transaction.date) ?? Date()
            let components = Calendar.current.dateComponents([.year, .month], from: originalDate)
            let date = Calendar.current.date(from: components)!
            let existing = values[date] ?? []
            values[date] = existing + [transaction]
        }
    }

    func groupTransactionsByCategory(_ transactions: [Transaction]) -> [CashExpense] {

        var cashExpences = [CashExpense]()
        let categories = Dictionary(grouping: transactions, by: { $0.category })

        for key in categories.keys {
             guard
                 let transactions: [Transaction] = categories[key] else { continue }

             let amounts = transactions.map { $0.amount }
             let converteToDoubleAmounts = amounts.compactMap { Double($0 ?? "".trimmingCharacters(in: .whitespaces )) }

            cashExpences.append(CashExpense(amount: converteToDoubleAmounts.reduce(0, +),
                                            category: key ?? .localized(.dashboardUnknownCategoryKey)))
         }

        return cashExpences
    }

    func groupTransactionsByCategories(_ transactions: [Transaction]) -> [MonthlyCashExpense] {

        var monthlyCashExpense = [MonthlyCashExpense]()

        let groupedByMonth = groupTransactionsByMonth(transactions)
        let groypedByMonthSortedKeys = Array(groupedByMonth.keys).sorted(by: { $0.compare($1) == .orderedDescending })

        for key in groypedByMonthSortedKeys {

            guard
                let transactions: [Transaction] = groupedByMonth[key] else { continue }

            let categories = groupTransactionsByCategory(transactions)

            monthlyCashExpense.append(MonthlyCashExpense(date: key, cashGroups: categories))
        }

        return monthlyCashExpense
    }
}
