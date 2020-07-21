//
//  ServicesAssembly.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Swinject

final class ServicesAssembly: Assembly {

    func assemble(container: Container) {
        // launch service
        container.register(LaunchService.self) { _ in
            LaunchServiceImp()
        }

        // api client
        container.register(APIClient<TransactionsAPI>.self) { resolver in
            APIClient()
        }
    }
}
