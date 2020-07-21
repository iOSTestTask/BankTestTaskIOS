//
//  DashboardViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit

final class DashboardViewController: UIViewController, StoryboardLoadable {

    var output: DashboardViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Dashoboard"
        output.viewIsReady()
    }

    

}

// MARK: - DashboardViewInput
extension DashboardViewController: DashboardViewInput {

    func setupInitialState() {}
}
