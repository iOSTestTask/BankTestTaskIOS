//
//  SignUpAssembly.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Swinject

class SignUpModuleAssembly: Assembly {
    typealias View = SignUpViewController
    typealias Interactor = SignUpInteractor
    typealias Presenter = SignUpPresenter
    typealias Router = SignUpRouter
    typealias ModuleOutput = SignUpModuleOutput

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

        container.register(Interactor.self) { (_, presenter: Presenter) in
            let interactor = Interactor()
            interactor.output = presenter
            return interactor
        }
    }
}
