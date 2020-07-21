//
//  SignUpInteractor.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation
import PromiseKit

class SignUpInteractor {

    weak var output: SignUpInteractorOutput?

    var apiClient: APIClient<AuthentificationAPI>!

    // MARK: - Private properties
    private var email: String?
    private var password: String?
    private var firstName: String?
    private var lastName: String?
    private var gender: Gender?
    private var phoneNumber: String?
    private var dateOfBirth: Date?
}

// MARK: - SignUpInteractorInput
extension SignUpInteractor: SignUpInteractorInput {
    func updateEmail(_ email: String?) {
        self.email = email
    }

    func updatePassword(_ password: String?) {
        self.password = password
    }

    func updatePhone(_ phone: String?) {
        self.phoneNumber = phone
    }

    func updateDateOfBirth(_ date: Date?) {
        self.dateOfBirth = date
    }

    func updateGender(_ gender: Gender) {
        self.gender = gender
    }

    func updateFirstName(_ firstName: String?) {
        self.firstName = firstName
    }

    func updateLastName(_ lastName: String?) {
        self.lastName = lastName
    }

    func signUp() {

        #if DEBUG
            email = StubData.email
            password = StubData.password
            firstName = StubData.firstName
            lastName = StubData.lastName
            phoneNumber = StubData.phone
            dateOfBirth = StubData.dob
            gender = StubData.gender
        #endif

        // FIXME: add real validation
        guard
            let email = email,
            let password = password,
            let firstName = firstName,
            let lastName = lastName else { return }

        login(email, password, firstName, lastName, gender, phoneNumber, dateOfBirth).done { [weak self] result in
            self?.output?.interactorDidSignUp()
        }.catch { [weak self] error in
            if let serverError = error as? APIError {
                switch serverError {
                case .cancelled: return
                default: self?.output?.interactorDidFailSignUp(serverError.localizedDescription)
                }
            }
        }
    }
}


// MARK: - Networking
private extension SignUpInteractor {
    func login(_ email: String,
               _ password: String,
               _ firstName: String,
               _ lastName: String,
               _ gender: Gender?,
               _ phoneNumber: String?,
               _ dob: Date?) -> Promise<APIEmptyResult> {
        let request = SignUpRequest(email: email,
                                    password: password,
                                    firstName: firstName,
                                    lastName: lastName,
                                    phone: phoneNumber,
                                    dob: dob?.timeIntervalSince1970,
                                    gender: gender?.rawValue)
        return apiClient.request(target: AuthentificationAPI.signUp(request))
    }
}
