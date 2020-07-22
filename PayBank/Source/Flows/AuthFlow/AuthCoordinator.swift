//
//  AuthCoordinator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject

typealias AuthCoordinator = Coordinator

protocol AuthCoordinatorOutput: class {

    func finishAuthFlow(_ coordinator: AuthCoordinator)
}

final class AuthCoordinatorImp: BaseCoordinator {

    // MARK: - Public
    var resolver: Resolver!
    var router: Router!
    weak var output: AuthCoordinatorOutput!

    // MARK: - Coordinator
    override func start(animated: Bool) {
         runSignInModule(animated)
    }
}

extension AuthCoordinatorImp: SignInModuleOutput {
    func signInModuleDidTapOnSignUp() {
        runSignUpFlow(animated: true)
    }

    func signInModuleDidLogin() {
        output.finishAuthFlow(self)
    }
}

extension AuthCoordinatorImp: SignUpModuleOutput {
    func signUpModuleDidTapClose() {
        router.dismissModule()
    }

    func signInModuleDidSignUp() {
        output.finishAuthFlow(self)
    }
}

// MARK: - Private
private extension AuthCoordinatorImp {

    func runSignInModule(_ animated: Bool) {
        guard
            let view = resolver.resolve((SignInViewController).self, argument: self as SignInModuleOutput) else {
                assertionFailure("Failed to resolve \(SignInViewController.self) and \(SignInModuleOutput.self)")
                return
        }

        router.setRootModule(view, hideBar: true, animated: animated)
    }

    func runSignUpFlow(animated: Bool) {

        guard
             let view = resolver.resolve((SignUpViewController).self, argument: self as SignUpModuleOutput) else {
                 assertionFailure("Failed to resolve \(SignUpViewController.self) and \(SignUpModuleOutput.self)")
                 return
         }

        router.present(view, animated: animated, completion: nil)
    }
}
