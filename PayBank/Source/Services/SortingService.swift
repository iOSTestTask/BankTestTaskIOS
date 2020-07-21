//
//  SortingService.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

protocol SortingService: class {

    func sort(_ transactions: [Transaction]) -> [Transaction]
}

// MARK: - SortingServiceImp
final class SortingServiceImp: NSObject {
    let dateFormatter: DateFormatter!

    override init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        super.init()
    }
}

// MARK: - SortingService
extension SortingServiceImp: SortingService {

    func sort(_ transactions: [Transaction]) -> [Transaction] {
        return transactions.sorted { dateFormatter.date(from: $0.date ?? "")! < dateFormatter.date(from: $1.date ?? "")! }
    }
}
