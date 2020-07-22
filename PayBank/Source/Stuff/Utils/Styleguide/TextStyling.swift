//
//  TextStyling.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/22/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

protocol TextStyling {
    func applyTextStyle(_ style: TextStyle)
}

extension UILabel: TextStyling {

    func applyTextStyle(_ style: TextStyle) {
        textColor = style.color
        font = style.font
    }
}
