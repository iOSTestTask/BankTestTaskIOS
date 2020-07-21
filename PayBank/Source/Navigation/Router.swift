//
//  Router.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

protocol Router: Presentable {

    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)

    func popModule()
    func popModule(animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool)

    func popToRootModule(animated: Bool)

    func set(isNavigationBarHidden: Bool)
}
