//
//  APIError.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum APIError: LocalizedError {

    case cancelled

    case timedOut

    case offline

    case couldNotParseResponce

    case underlying(error: Error)

    case custom(statusCode: Int, identifier: String?)

    init(error: Error) {
        guard let moyaError = error as? MoyaError else {
            self = .underlying(error: error)
            return
        }

        switch moyaError {
        case .underlying(let error as AFError, let response):
            guard
                case let .responseValidationFailed(reason) = error,
                case let .unacceptableStatusCode(statusCode) = reason else {
                    self = .underlying(error: moyaError)
                    return
            }
            self = APIError(statusCode: statusCode, response: response) ?? .underlying(error: moyaError)
        case .underlying(let nsError as NSError, _):
            switch nsError.code {
            case -999:
                self = .cancelled
            case -1_001:
                self = .timedOut
            case -1_009:
                self = .offline
            default:
                self = .underlying(error: moyaError)
            }
        default:
            self = .underlying(error: moyaError)
        }
    }

    private init?(statusCode: Int, response: Response?) {
        guard
            let response = response else {
                return nil
        }

        let apiCustomError = try? APICustomError.decode(from: response.data)
        let identifier = apiCustomError?.message
        self = .custom(statusCode: statusCode, identifier: identifier)

        // FIXME: add parse error status code
    }

    // FIXME: add localization
}
