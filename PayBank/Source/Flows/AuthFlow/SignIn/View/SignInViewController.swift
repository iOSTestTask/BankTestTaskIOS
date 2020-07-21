//
//  SignInViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController, StoryboardLoadable {

    var output: SignInViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - SignInViewInput
extension SignInViewController: SignInViewInput {

    func setupInitialState() {}
}
