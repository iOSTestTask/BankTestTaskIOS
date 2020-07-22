//
//  Localizable.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct Localizable {
    
    private let string: String
    private let args: CVaListPointer
    private let locale: Locale?

    var contents: String {
        return NSString(format: string, locale: locale, arguments: args) as String
    }

    init(_ contents: String, locale: Locale? = nil) {
        self.string = contents
        self.args = getVaList([])
        self.locale = locale
    }

    init(_ contents: String, _ args: CVarArg..., locale: Locale? = nil) {
        self.string = contents
        self.args = getVaList(args)
        self.locale = locale
    }
}

extension String {

    static func localized(_ key: Localizable) -> String {
        return key.contents
    }
}
