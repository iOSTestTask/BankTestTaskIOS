//
//  AuthenthificationRequests.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String

    let password: String
}

struct SignUpRequest: Encodable {
    let email: String

    let password: String

    let firstName: String

    let lastName: String

    let phone: String?

    let dob: TimeInterval?

    let gender: String?
}
