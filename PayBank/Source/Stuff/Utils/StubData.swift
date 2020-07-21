//
//  StubData.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

#if DEBUG
struct StubData {
    static let email = "Nadiah.Spoel@example.com"
    static let password = "springs"
    static let firstName = "Tom"
    static let lastName = "Newton"
    static let gender = Gender.male
    static let dob = Date()
    static let phone = "1049520521"
}
#endif
