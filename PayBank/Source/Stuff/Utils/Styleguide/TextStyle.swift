//
//  TextStyle.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/22/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

struct TextStyle {

    let font: UIFont
}

// MARK: - Styles
extension TextStyle {

    static let body = TextStyle(font: UIFont.preferredFont(forTextStyle: .body))
}
