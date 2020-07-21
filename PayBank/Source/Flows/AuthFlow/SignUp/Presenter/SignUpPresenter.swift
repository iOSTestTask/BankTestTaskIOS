//
//  SignUpPresenter.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

class SignUpPresenter {

    weak var view: SignUpViewInput!
    var interactor: SignUpInteractorInput!
    var router: SignUpRouterInput!
    weak var output: SignUpModuleOutput!
}

// MARK: - SignUpModuleInput
extension SignUpPresenter: SignUpModuleInput {}

// MARK: - SignUpViewOutput
extension SignUpPresenter: SignUpViewOutput {

    func viewIsReady() {
        view.setupInitialState()
    }
}

// MARK: - SignUpInteractorOutput
extension SignUpPresenter: SignUpInteractorOutput {}
