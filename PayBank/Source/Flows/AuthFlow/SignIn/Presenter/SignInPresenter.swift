//
//  SignInPresenter.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

class SignInPresenter {

    weak var view: SignInViewInput!
    var interactor: SignInInteractorInput!
    var router: SignInRouterInput!
    weak var output: SignInModuleOutput!
}

// MARK: - SignInModuleInput
extension SignInPresenter: SignInModuleInput {}

// MARK: - SignInViewOutput
extension SignInPresenter: SignInViewOutput {

    func viewIsReady() {
        view.setupInitialState()
    }
}

// MARK: - SignInInteractorOutput
extension SignInPresenter: SignInInteractorOutput {}
