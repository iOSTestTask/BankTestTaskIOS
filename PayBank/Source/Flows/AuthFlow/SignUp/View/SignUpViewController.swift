//
//  SignUpViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController, StoryboardLoadable {

    var output: SignUpViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - SignUpViewInput
extension SignUpViewController: SignUpViewInput {

    func setupInitialState() {}
}
