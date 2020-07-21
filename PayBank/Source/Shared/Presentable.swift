//
//  Presentable.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

// MARK: - Presentable
protocol Presentable: class {

    func toPresent() -> UIViewController
}

// MARK: - UIViewController
extension UIViewController: Presentable {

    func toPresent() -> UIViewController {
        return self
    }
}
