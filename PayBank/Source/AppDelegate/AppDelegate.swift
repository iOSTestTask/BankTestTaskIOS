//
//  AppDelegate.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit
import Swinject

// swiftlint:disable four_spaces
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Public properties
    var window: UIWindow?

    // MARK: - Private properties
    private var assembler: Assembler!

    lazy private var rootController: UINavigationController = {
        let rootController = UINavigationController()
        window?.rootViewController = rootController
        return rootController
    }()

    // MARK: - AppDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        resolveDependencies()
        start()

        return true
    }
}

// MARK: - Private
private extension AppDelegate {

    func resolveDependencies() {
        let services = Assembler([ServicesAssembly()])
        let flows = Assembler([SignInModuleAssembly(),
                               SignUpModuleAssembly(),
                               TransactionsModuleAssembly(),
                               DashboardModuleAssembly()], parent: services)

        assembler = Assembler([CoordinatorsAssembly()], parent: flows)
    }

    func start() {
        let applicationCoordinator = assembler.resolver.resolve(ApplicationCoordinator.self,
                                                                argument: rootController)
        applicationCoordinator?.start(animated: false)
    }
}
