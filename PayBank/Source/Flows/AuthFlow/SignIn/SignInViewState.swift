//
//  SignInViewState.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct SignInViewControllerViewState {

    var emailRow: String?

    var paswordRow: String?

    var signInButtonTitle: String?

    var signUpButtonTitle: String?

    var onSignInTap: (() -> ())?

    var onSignUpTap: (() -> ())?
}
