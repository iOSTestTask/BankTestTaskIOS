//
//  BaseCoordinator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

// MARK: - BaseCoordinator
class BaseCoordinator: NSObject, Coordinator {

    // MARK: - Public properties
    var childCoordinators: [Coordinator] = []

    // MARK: - Public methods
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func clearDependencies() {
        childCoordinators.removeAll()
    }

    // MARK: - Coordinator
    func start(animated: Bool) {
          fatalError("start(animated:) has not been implemented")
    }
}
