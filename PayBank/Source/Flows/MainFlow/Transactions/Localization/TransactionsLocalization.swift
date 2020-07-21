//
//  TransactionsLocalization.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

extension Localizable {
    static var transactionsTabbarTitle: Localizable {
        Localizable(NSLocalizedString("Transactions",
                                      comment: "Transactions | Tabbar | "))
    }

    static var transactionsNavigationTitle: Localizable {
        Localizable(NSLocalizedString("Transactions",
                                      comment: "Transactions | Navigation | "))
    }
}
