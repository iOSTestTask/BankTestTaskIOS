//
//  SignUpViewOutput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

protocol SignUpViewOutput {

    func viewIsReady()

    func viewDidEndFillingEmail(_ email: String?)

    func viewDidEndFillingPassword(_ password: String?)

    func viewDidEndFillingFirstName(_ firstName: String?)

    func viewDidEndFillingLastName(_ lastName: String?)

    func viewDidEndFillingPhoneNumber(_ phoneNumber: String?)

    func viewDidEndFillingDate(_ date: Date?)

    func viewDidFillingGender(_ gender: Gender)
}
