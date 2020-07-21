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
        runLoginFlow(animated: animated)
    }
}

// MARK: - Private
private extension AuthCoordinatorImp {
    func runLoginFlow(animated: Bool) {

    }

    func runSignInFlow(animated: Bool) {

    }
}
