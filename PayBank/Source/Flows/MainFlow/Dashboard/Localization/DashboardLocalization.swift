//
//  DashboardLocalization.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

extension Localizable {
    static var dashboardTabbarTitle: Localizable {
        Localizable(NSLocalizedString("Dashboard",
                                      comment: "Dashboard | Tabbar | "))
    }

    static var dashboardNavigationTitle: Localizable {
        Localizable(NSLocalizedString("Dashboard",
                                      comment: "Dashboard | Navigation | "))
    }

    static var dashboardUnknownCategoryKey: Localizable {
        Localizable(NSLocalizedString("unknown",
                                             comment: "Dashboard | Category | Unknown"))
    }
}
