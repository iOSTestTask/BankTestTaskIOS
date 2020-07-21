//
//  CoordinatorsAssembly.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject

final class CoordinatorsAssembly: Assembly {

    func assemble(container: Container) {

        // router
        container.register(Router.self) { (_, rootController: UINavigationController) in
            RouterImp(rootController: rootController)
        }

        // application
        container.register(ApplicationCoordinator.self) { (resolver, rootController: UINavigationController) in
            let coordinator = ApplicationCoordinatorImp()
            coordinator.router = resolver.resolve(Router.self, argument: rootController)
            coordinator.coordinatorResolver = resolver
            coordinator.launchService = resolver.resolve(LaunchService.self)!
            
            return coordinator
        }.inObjectScope(.container)

        // auth
        container.register(AuthCoordinator.self) { (resolver, router: Router?, output: AuthCoordinatorOutput) in
            let coordinator = AuthCoordinatorImp()
            coordinator.resolver = resolver
            coordinator.router = router
            coordinator.output = output
            return coordinator
        }

        // main
        container.register(MainCoordinator.self) { (resolver, router: Router?, output: MainCoordinatorOutput) in
            let coordinator = MainCoordinatorImp()
            coordinator.resolver = resolver
            coordinator.router = router
            coordinator.output = output
            return coordinator
        }

        // transactions
        container.register(TransactionsCoordinator.self) { (resolver, rootController: UINavigationController, output: TransactionsCoordinatorOutput) in
            let coordinator = TransactionsCoordinatorImp()
            coordinator.resolver = resolver
            coordinator.router = resolver.resolve(Router.self, argument: rootController)
            coordinator.output = output
            return coordinator
        }

        // dashboard
        container.register(DashboardCoordinator.self) { (resolver, rootController: UINavigationController, output: DashboardCoordinatorOutput) in
            let coordinator = DashboardCoordinatorImp()
            coordinator.resolver = resolver
            coordinator.router = resolver.resolve(Router.self, argument: rootController)
            coordinator.output = output
            return coordinator
        }
    }
}
