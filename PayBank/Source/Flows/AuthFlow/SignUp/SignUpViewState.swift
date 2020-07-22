//
//  SignUpViewState.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct SignUpViewControllerViewState {

    var emailRow: String?

    var paswordRow: String?

    var firstNameRow: String?

    var lastNameRow: String?

    var phoneRow: String?

    var dateOfBirth: String?

    var genderTitle: String?

    var genderOptions: [String]?

    var genderDefaultOption: String?

    var closeButtonTitle: String?

    var signUpButtonTitle: String?

    var onSignUpTap: (() -> ())?

    var onCloseTap: (() -> ())?
}
