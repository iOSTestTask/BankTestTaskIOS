//
//  TextStyle.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/22/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

struct TextStyle {

    // FIXME: add color to style
    let font: UIFont
}

func * (style: TextStyle, alpha: Alpha) -> TextStyle {
    TextStyle(font: style.font)
}

func + (style: TextStyle, color: UIColor) -> TextStyle {
    TextStyle(font: style.font)
}

// MARK: - Styles
extension TextStyle {

    static let body = TextStyle(font: UIFont.preferredFont(forTextStyle: .body))
}
