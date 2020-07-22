//
//  ApplicationCoordinator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject

typealias ApplicationCoordinator = Coordinator

// MARK: - ApplicationCoordinator
final class ApplicationCoordinatorImp: BaseCoordinator {

    // MARK: - Public properties
    var coordinatorResolver: Resolver!
    var router: Router!
    var launchService: LaunchService!

    // MARK: - Coordinator
    override func start(animated: Bool) {
        runFlow(launchService.resolveLaunchMode(), animated)
    }
}

extension ApplicationCoordinatorImp: AuthCoordinatorOutput {

    func finishAuthFlow(_ coordinator: AuthCoordinator) {
        removeDependency(coordinator)
        runMainFlow(false)
    }
}

extension ApplicationCoordinatorImp: MainCoordinatorOutput {

    func finishMainFlow(_ coordinator: MainCoordinator) {
        removeDependency(coordinator)
    }
}

// MARK: - Private
private extension ApplicationCoordinatorImp {

    func runFlow(_ mode: LaunchMode, _ animated: Bool) {
        switch mode {
        case .auth:
            runAuthFlow(animated)
        case .main:
            runMainFlow(animated)
        }
    }

    func runAuthFlow(_ animated: Bool) {
        guard
            let coordinator = coordinatorResolver.resolve(AuthCoordinator.self, arguments: router, self as AuthCoordinatorOutput) else {
                assertionFailure("Failed to resolve \(AuthCoordinator.self)")
                return
        }

        addDependency(coordinator)
        coordinator.start(animated: animated)
    }

    func runMainFlow(_ animated: Bool) {
        guard
            let coordinator = coordinatorResolver.resolve(MainCoordinator.self, arguments: router, self as MainCoordinatorOutput) else {
                assertionFailure("Failed to resolve \(MainCoordinator.self)")
                return
        }

        addDependency(coordinator)
        coordinator.start(animated: animated)
    }
}
