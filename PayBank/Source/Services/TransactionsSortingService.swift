//
//  SortingService.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

protocol TransactionsSortingService: class {

    func sort(_ transactions: [Transaction], _ assending: Bool) -> [Transaction]
}

// MARK: - TransactionsSortingServiceImp
final class TransactionsSortingServiceImp: NSObject {

    // MARK: - Private properties
    private let dateFormatter: DateFormatter!

    override init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        super.init()
    }
}

// MARK: - TransactionsSortingService
extension TransactionsSortingServiceImp: TransactionsSortingService {

    func sort(_ transactions: [Transaction], _ assending: Bool) -> [Transaction] {

        return transactions.sorted {
            guard
                let lhs = dateFormatter.date(from: $0.date ?? ""),
                let rhs = dateFormatter.date(from: $1.date ?? "") else { return false }

            return assending ? lhs < rhs : lhs > rhs
        }
    }
}
