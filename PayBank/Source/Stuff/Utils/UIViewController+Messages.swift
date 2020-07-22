//
//  UIViewController+Messages.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

extension UIViewController {

    func showOverNavigationBar(success: String) {
        MessagesCoordinator.showOverNavigationBar(success: success)
    }

    func showOverNavigationBar(error: String) {
        MessagesCoordinator.showOverNavigationBar(error: error)
    }
}
