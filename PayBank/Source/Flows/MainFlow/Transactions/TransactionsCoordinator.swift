//
//  TransactionsCoordonator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject

protocol TransactionsCoordinatorOutput: class {

    func finisTransactionsFlow(_ coordinator: TransactionsCoordinator)
}

typealias TransactionsCoordinator = Coordinator

final class TransactionsCoordinatorImp: BaseCoordinator {

    // MARK: - Public
    var resolver: Resolver!
    var router: Router!
    weak var output: TransactionsCoordinatorOutput!

    // MARK: - Coordinator
    override func start(animated: Bool) {
        runTransactionsModule(animated)
    }
}

extension TransactionsCoordinatorImp: TransactionsModuleOutput {
}

// MARK: - Private
private extension TransactionsCoordinatorImp {

    func runTransactionsModule(_ animated: Bool) {
        guard
            let view = resolver.resolve((TransactionsViewController).self, argument: self as TransactionsModuleOutput) else {
                assertionFailure("Failed to resolve \(TransactionsViewController.self) and \(TransactionsModuleOutput.self)")
                return
        }

        router.setRootModule(view, hideBar: false, animated: animated)
    }
}
