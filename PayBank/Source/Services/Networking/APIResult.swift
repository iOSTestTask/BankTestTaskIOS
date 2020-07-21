//
//  APIResult.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - APICustomError
struct APICustomError: Decodable {

    var message: String?
}

// MARK: - APIEmptyResulst
struct APIEmptyResult: Codable {}

// FIXME: Add class for collections
