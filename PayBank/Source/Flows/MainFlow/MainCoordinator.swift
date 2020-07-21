//
//  MainCoordinator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject
import UIKit

protocol MainCoordinatorOutput: class {

    func finishMainFlow(_ coordinator: MainCoordinator)
}

typealias MainCoordinator = Coordinator

final class MainCoordinatorImp: BaseCoordinator {

    // MARK: - Public
    var resolver: Resolver!
    var router: Router!
    weak var output: MainCoordinatorOutput!

    // MARK: - Private properies
    private let tabController: UITabBarController = UITabBarController()
    private let transactionsNavController: UINavigationController = UINavigationController()
    private let dashboardNavController: UINavigationController = UINavigationController()

    private var transactionCoordinator: Coordinator?
    private var dashboardCoordinator: Coordinator?

    // MARK: - Coordinator
    override func start(animated: Bool) {
        runTabBarFlow(animated: animated)
    }
}

// MARK: - TransactionsCoordinatorOutput
extension MainCoordinatorImp: TransactionsCoordinatorOutput {
    func finisTransactionsFlow(_ coordinator: TransactionsCoordinator) {
        removeDependency(coordinator)
    }
}

// MARK: - DashboardCoordinatorOutput
extension MainCoordinatorImp: DashboardCoordinatorOutput {
    func finisDashboardFlow(_ coordinator: DashboardCoordinator) {
        removeDependency(coordinator)
    }
}

// MARK: - Private
private extension MainCoordinatorImp {

    func runTabBarFlow(animated: Bool) {

        guard
            let transactionCoordinator = resolver.resolve(TransactionsCoordinator.self, arguments: transactionsNavController, self as TransactionsCoordinatorOutput) else {
                assertionFailure("Failed to resolve \(TransactionsCoordinator.self)")
                return
        }

        transactionCoordinator.start(animated: false)
        addDependency(transactionCoordinator)

        guard
            let dashboardCoordinator = resolver.resolve(DashboardCoordinator.self, arguments: dashboardNavController, self as DashboardCoordinatorOutput) else {
                assertionFailure("Failed to resolve \(DashboardCoordinator.self)")
                return
        }

        dashboardCoordinator.start(animated: false)
        addDependency(dashboardCoordinator)

        self.tabController.setViewControllers([transactionsNavController,
                                               dashboardNavController], animated: false)

        router.setRootModule(tabController, hideBar: true, animated: false)
    }
}
