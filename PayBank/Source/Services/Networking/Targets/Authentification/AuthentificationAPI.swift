//
//  AuthentificationTarget.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Moya

enum AuthentificationAPI {
    case login(LoginRequest) // login http://localhost:3000/authenticate
    case signUp(SignUpRequest) // signUp http://localhost:3000/customers
}

extension AuthentificationAPI: TargetTypeExtension {
    var baseURL: URL {
        guard
            let baseURL = URL(string: "http://\(APIDomain.api.rawValue)\(APIDomain.port.rawValue)/") else {
                fatalError("Failed to build base url")
        }

        return baseURL
    }

    var path: String {
        switch self {
        case .login:
            return "authenticate"
        case .signUp:
            return "customers"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case.signUp:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .login(let request as Encodable):
            return .requestParameters(parameters: request.toDictionary(), encoding: JSONEncoding.default)
        case .signUp(let request as Encodable):
        return .requestParameters( parameters: request.toDictionary(), encoding: JSONEncoding.default)
    }
}

var validationType: ValidationType {
    return .successCodes
}

var headers: [String: String]? {
    return nil
}
}
