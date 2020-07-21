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
