//
//  TransactionsTarget.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Moya

enum TransactionsAPI {

    case fetch // fetch list of transactions from http://localhost:3000/transactions
}

extension TransactionsAPI: TargetTypeExtension {

    var baseURL: URL {
        guard
            let baseURL = URL(string: "http://\(APIDomain.api.rawValue)\(APIDomain.port.rawValue)/") else {
                fatalError("Failed to build base url")
        }

        return baseURL
    }

    var path: String {
        switch self {
        case .fetch:
            return "transactions"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetch:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .fetch:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return nil
    }
}
