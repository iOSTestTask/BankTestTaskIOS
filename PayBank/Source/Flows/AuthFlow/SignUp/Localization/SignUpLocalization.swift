//
//  SignUpLocalization.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

extension Localizable {

    static var signUpEmailTitle: Localizable {
        Localizable(NSLocalizedString("Email:",
                                      comment: "SignUP | Email | "))
    }

    static var signUpPasswordTitle: Localizable {
        Localizable(NSLocalizedString("Password:",
                                      comment: "SignUP | Password | "))
    }

    static var signUpFirstNameTitle: Localizable {
        Localizable(NSLocalizedString("First Name:",
                                      comment: "SignUP | First Name | "))
    }

    static var signUpLastNameTitle: Localizable {
        Localizable(NSLocalizedString("Last Name:",
                                      comment: "SignUP | Last Name | "))
    }

    static var signUpPhoneTitle: Localizable {
        Localizable(NSLocalizedString("Phone number:",
                                      comment: "SignUP | Phone | "))
    }

    static var signUpDateOfBirthTitle: Localizable {
        Localizable(NSLocalizedString("Date of Birth:",
                                      comment: "SignUP | Date of Birth | "))
    }

    static var signUpGenderTitle: Localizable {
        Localizable(NSLocalizedString("Gender",
                                      comment: "SignUP | Gender | "))
    }

    static var closeInButtonTitle: Localizable {
        Localizable(NSLocalizedString("CLOSE",
                                      comment: "SignUP | Close | "))
    }
}
