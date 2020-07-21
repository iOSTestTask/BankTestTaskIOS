//
//  SignInLocalization.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

extension Localizable {

    static var signInEmailTitle: Localizable {
        Localizable(NSLocalizedString("Email:",
                                      comment: "SignIn | Email | "))
    }

    static var signInPasswordTitle: Localizable {
        Localizable(NSLocalizedString("Password:",
                                      comment: "SignIn | Password | "))
    }

    static var signInButtonTitle: Localizable {
          Localizable(NSLocalizedString("SIGN IN",
                                        comment: "SignIn | Sign IN | "))
    }

    static var signUpButtonTitle: Localizable {
            Localizable(NSLocalizedString("SIGN UP",
                                          comment: "SignIn | Sign UP | "))
      }
}
