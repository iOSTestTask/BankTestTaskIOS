//
//  Codable.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

let defaultJsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

let defaultJsonEncoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return encoder
}()

extension Decodable {

    static func decode(from data: Data, using decoder: JSONDecoder = defaultJsonDecoder) throws -> Self {
        try decoder.decode(Self.self, from: data)
    }

    init(jsonDictionary: [String: Any], decoder: JSONDecoder = defaultJsonDecoder) throws {
        let data = try JSONSerialization.data(withJSONObject: jsonDictionary, options: [])
        self = try decoder.decode(Self.self, from: data)
    }
}

extension Encodable {

    func encode(using encoder: JSONEncoder = defaultJsonEncoder) throws -> Data {
        try encoder.encode(self)
    }

    func toDictionary(using encoder: JSONEncoder = defaultJsonEncoder) -> [String: Any] {
        do {
            let data = try encode(using: encoder)
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
        } catch {
            assertionFailure("""
                Failed to convert
                \(self)
                to dictionary with error:
                \(error.localizedDescription)
                """)
            return [:]
        }
    }
}
