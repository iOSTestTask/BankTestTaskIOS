//
//  StoryboardLoadable.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

// MARK: - StoryboardLoadable
protocol StoryboardLoadable: class {

    static func loadFromStoryboard() -> Self

    static func loadFromStoryboard(_ name: String) -> Self
}

// MARK: - UIViewController
extension StoryboardLoadable where Self: UIViewController {

    static func loadFromStoryboard() -> Self {
        let name = String(describing: Self.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)

        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Error: Unable to load \(name) from storyboard")
        }

        return viewController
    }

    static func loadFromStoryboard(_ name: String) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let identifier = String(describing: Self.self)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Can't instantiate vc \(identifier) from storyboard \(name)")
        }

        return viewController
    }
}
