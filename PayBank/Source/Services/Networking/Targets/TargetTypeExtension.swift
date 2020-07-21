//
//  TargetTypeExtension.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Moya

let defaultTimeoutSeconds: TimeInterval = 30

protocol TargetTypeExtension: TargetType {

    var timeoutSeconds: TimeInterval { get }
}

extension TargetTypeExtension {

    var sampleData: Data {
        return Data()
    }

    var timeoutSeconds: TimeInterval {
        return defaultTimeoutSeconds
    }
}
