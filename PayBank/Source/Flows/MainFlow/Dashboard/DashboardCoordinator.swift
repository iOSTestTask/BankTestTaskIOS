//
//  DashboardCoordinator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject

protocol DashboardCoordinatorOutput: class {

    func finisDashboardFlow(_ coordinator: DashboardCoordinator)
}

typealias DashboardCoordinator = Coordinator

final class DashboardCoordinatorImp: BaseCoordinator {

     // MARK: - Public
    var resolver: Resolver!
    var router: Router!
    weak var output: DashboardCoordinatorOutput!

    // MARK: - Coordinator
    override func start(animated: Bool) {
        runDashboardModule(animated)
    }
}

// MARK: - DashboardModuleOutput
extension DashboardCoordinatorImp: DashboardModuleOutput {

}

// MARK: - Private
private extension DashboardCoordinatorImp {

    func runDashboardModule(_ animated: Bool) {
        guard
            let view = resolver.resolve((DashboardViewController).self, argument: self as DashboardModuleOutput ) else {
                assertionFailure("Failed to resolve \(DashboardViewController.self) and \(DashboardModuleOutput.self)")
                return
        }

        router.setRootModule(view, hideBar: false, animated: animated)
    }
}
