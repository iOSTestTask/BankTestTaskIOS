//
//  UIColor+Design.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/22/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

func * (color: UIColor, alpha: Alpha) -> UIColor {
    return color.withAlphaComponent(CGFloat(alpha.rawValue))
}

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIColor {
}
