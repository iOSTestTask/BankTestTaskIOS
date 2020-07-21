//
//  SignInViewInput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

protocol SignInViewInput: class {

    func setupInitialState(_ viewState: SignInViewControllerViewState)

    func showOverNavigationBar(error: String)
}
