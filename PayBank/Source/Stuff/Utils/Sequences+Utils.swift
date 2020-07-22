//
//  Sequences+Utils.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/22/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

public extension Sequence {

    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.append(element) {
                categories[key] = [element]
            }
        }
        return categories
    }
}
