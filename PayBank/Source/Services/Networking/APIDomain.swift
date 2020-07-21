//
//  APIDomain.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

enum APIDomain: String {

    #if DEBUG
        // FIXME: replace with localhost (due to system problems on local machine)
        case api = "127.0.0.1"
        case port = ":3000"
    #else
        // FIXME: replace with localhost (due to system problems on local machine)
        case api = "127.0.0.1"
        case port = ":3000"
    #endif
}
