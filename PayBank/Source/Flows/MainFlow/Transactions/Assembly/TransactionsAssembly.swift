//
//  TransactionsAssembly.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Swinject

class TransactionsModuleAssembly: Assembly {
    typealias View = TransactionsViewController
    typealias Interactor = TransactionsInteractor
    typealias Presenter = TransactionsPresenter
    typealias Router = TransactionsRouter
    typealias ModuleOutput = TransactionsModuleOutput

    func assemble(container: Container) {
        container.register(Router.self) { resolver in
            let router = Router()
            router.modulesResolver = resolver
            return router
        }

        container.register(View.self) { (resolver, output: ModuleOutput) in
            let viewController = View.loadFromStoryboard()
            viewController.output = resolver.resolve(Presenter.self, arguments: viewController, output)
            return viewController
        }

        container.register(Presenter.self) { (resolver, viewController: View, output: ModuleOutput) in
            let presenter = Presenter()
            presenter.view = viewController
            presenter.router = resolver.resolve(Router.self)
            presenter.interactor = resolver.resolve(Interactor.self, argument: presenter)
            presenter.output = output
            return presenter
        }

        container.register(Interactor.self) { (resolver, presenter: Presenter) in

            guard
                let apiClient = resolver.resolve(APIClient<TransactionsAPI>.self) else {
                    fatalError("Can't resolve \(APIClient<TransactionsAPI>.self)")
            }

            let interactor = Interactor()
            interactor.output = presenter
            interactor.transactionAPIClient = apiClient
            interactor.timeFormatter = resolver.resolve(TimeFormatterService.self)
            interactor.sortingService = resolver.resolve(SortingService.self)
            
            return interactor
        }
    }
}
