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

    static func transactionsDate(_ date: String) -> Localizable {
        Localizable(NSLocalizedString("Date: %@",
                                      comment: "Transactions | Cell | Date"), date)
    }

    static func transactionsVendor(_ vendor: String) -> Localizable {
        Localizable(NSLocalizedString("Vendor: %@",
                                      comment: "Transactions | Cell | Vendor"), vendor)
    }

    static func transactionsAmount(_ amount: String) -> Localizable {
        Localizable(NSLocalizedString("Amount: %@",
                                      comment: "Transactions | Cell | Amount"), amount)
    }

    static func transactionsCategory(_ category: String) -> Localizable {
        Localizable(NSLocalizedString("Category: %@",
                                      comment: "Transactions | Cell | Category"), category)
    }

    static var transactionsLogoutButtonTitle: Localizable {
        Localizable(NSLocalizedString("Logout",
                                      comment: "Transactions | Logout | "))
    }
}
