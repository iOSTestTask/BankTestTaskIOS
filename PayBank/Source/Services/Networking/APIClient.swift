//
//  APIClient.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import Moya
import PromiseKit

struct APIClient<Target: TargetTypeExtension> {

    // MARK: - Private Properies
    private let moyaProvider: MoyaProvider<Target>

    init() {
        self.moyaProvider = MoyaProvider<Target>()
    }

    // MARK: - Public methods
    func request<Result: Codable>(target: Target,
                                  handleCancellable: ((Cancellable) -> Void)? = nil) -> Promise<Result> {
        return Promise<Result> { seal in

            var isTimedOut = false
            let cancellable = self.moyaProvider.request(target) { result in

                guard !isTimedOut else {
                    seal.reject(APIError.timedOut)
                    return
                }

                switch result {
                case .success(let response):
                    do {
                        let result = try Result.decode(from: response.data)
                        seal.fulfill(result)
                    } catch {
                      seal.reject(APIError.couldNotParseResponce)
                    }
                case .failure(let moyaError):
                    let apiError = APIError(error: moyaError)

                    #if DEBUG
                        Log.error("Request failed with: \(moyaError.localizedDescription)", tag: .network)
                    if
                        let responseData = moyaError.response?.data,
                        let jsonResponse = try? JSONSerialization.jsonObject(with: responseData, options: []) {
                        Log.error("Failed request response: \(jsonResponse)", tag: .network)
                    }
                    #endif

                    seal.reject(apiError)
                }
            }

            handleCancellable?(cancellable)

            after(seconds: target.timeoutSeconds).done {
                isTimedOut = true
                cancellable.cancel()
            }
        }
    }
}
