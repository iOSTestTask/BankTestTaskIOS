//
//  SignUpInteractorInput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

protocol SignUpInteractorInput {

    func updateEmail(_ email: String?)

    func updatePassword(_ password: String?)

    func updateFirstName(_ firstName: String?)

    func updateLastName(_ lastName: String?)

    func updatePhone(_ phone: String?)

    func updateDateOfBirth(_ date: Date?)

    func updateGender(_ gender: Gender)

    func signUp()
}
