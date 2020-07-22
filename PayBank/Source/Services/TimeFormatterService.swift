//
//  TimeFormatterService.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation

protocol TimeFormatterService: class {

    func makeShortString(from date: Date) -> String

    func makeShortMonthString(from date: Date) -> String

    func makeShortString(from string: String?) -> String?

    func makeDate(from string: String?) -> Date?
}

final class TimeFormatterServiceImp: NSObject {

    private let dateFormatter: DateFormatter!

    override init() {
        self.dateFormatter = DateFormatter()
        super.init()
    }
}

// MARK: - TimeFormatterService
extension TimeFormatterServiceImp: TimeFormatterService {

    func makeShortMonthString(from date: Date) -> String {
        dateFormatter.dateFormat = "MM yyyy"
        return dateFormatter.string(from: date)
    }

    func makeShortString(from date: Date) -> String {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }

    func makeDate(from string: String?) -> Date? {
        guard
            let string = string else { return nil }
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.date(from: string)
    }

    func makeShortString(from string: String?) -> String? {

        guard
            let string = string else { return nil }

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard
            let date = dateFormatter.date(from: string) else { return nil }

        return makeShortString(from: date)
    }
}
