//
//  LaunchService.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

enum LaunchMode {
    case auth, main
}

protocol LaunchService {

    func resolveLaunchMode() -> LaunchMode
}

// MARK: - LaunchServiceImp
final class LaunchServiceImp {
}

// MARK: - LaunchService
extension LaunchServiceImp: LaunchService {

    func resolveLaunchMode() -> LaunchMode {
        return .auth
    }
}
