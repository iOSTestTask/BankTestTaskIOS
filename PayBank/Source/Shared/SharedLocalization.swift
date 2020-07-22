//
//  SharedLocalization.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

extension Localizable {
    static var noResults: Localizable {
        Localizable(NSLocalizedString("No data",
                                      comment: "Shared | No results | No data"))
    }

    static var noResultsInCell: Localizable {
        Localizable(NSLocalizedString("--",
                                      comment: "Shared | No results | -- "))
    }

    static var errorMessageTitle: Localizable {
        Localizable(NSLocalizedString("Error",
                                      comment: "Messages | Error | "))
    }
}
