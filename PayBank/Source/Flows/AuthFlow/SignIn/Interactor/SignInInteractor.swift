//
//  SignInInteractor.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import PromiseKit
class SignInInteractor {

    // MARK: - Public properties
    weak var output: SignInInteractorOutput?
    var apiClient: APIClient<AuthentificationAPI>!

    // MARK: - Private properties
    private var email: String?
    private var password: String?
}

// MARK: - SignInInteractorInput
extension SignInInteractor: SignInInteractorInput {
    func updateEmail(_ email: String?) {
        self.email = email
    }

    func updatePassword(_ password: String?) {
        self.password = password
    }

    func login() {

        #if DEBUG
            email = StubData.email
            password = StubData.password
        #endif

        // FIXME: add real validation
        guard
            let email = email, let password = password else { return }

        login(email, password).done { [weak self] result in
            self?.output?.interactorDidLogin()
        }.catch { [weak self] error in
            if let serverError = error as? APIError {
                switch serverError {
                case .cancelled: return
                default: self?.output?.interactorDidFailLogin(serverError.localizedDescription)
                }
            }
        }
    }
}

// MARK: - Networking
private extension SignInInteractor {
    func login(_ email: String, _ password: String) -> Promise<APIEmptyResult> {
        let request = LoginRequest(email: email, password: password)
        return apiClient.request(target: AuthentificationAPI.login(request))
    }
}
