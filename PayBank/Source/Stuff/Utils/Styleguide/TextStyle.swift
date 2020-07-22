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
    let color: UIColor
}

func * (style: TextStyle, alpha: Alpha) -> TextStyle {
    TextStyle(font: style.font, color: style.color * alpha)
}

func + (style: TextStyle, color: UIColor) -> TextStyle {
    TextStyle(font: style.font, color: color)
}

// MARK: - Styles
extension TextStyle {

    static let title = TextStyle(font: UIFont.preferredFont(forTextStyle: .headline), color: .black)
    static let subtitle = TextStyle(font: UIFont.preferredFont(forTextStyle: .subheadline), color: .black)
    static let input = TextStyle(font: UIFont.preferredFont(forTextStyle: .body), color: .black)
}
