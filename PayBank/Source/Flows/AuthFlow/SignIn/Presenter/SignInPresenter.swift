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
        let initionalViewState = makeInitionalViewState()
        view.setupInitialState(initionalViewState)
    }

    func viewDidEndFillingEmail(_ email: String?) {
        interactor.updateEmail(email)
    }

    func viewDidEndFillingPassword(_ password: String?) {
        interactor.updatePassword(password)
    }
}

// MARK: - SignInInteractorOutput
extension SignInPresenter: SignInInteractorOutput {

    func interactorDidLogin() {
        output.signInModuleDidLogin()
    }

    func interactorDidFailLogin(_ errorDescription: String) {
        view.showOverNavigationBar(error: errorDescription)
    }
}

// MARK: - View States
private extension SignInPresenter {

    func makeInitionalViewState() -> SignInViewControllerViewState {
        return SignInViewControllerViewState(emailRow: .localized(.signInEmailTitle),
                                             paswordRow: .localized(.signInPasswordTitle),
                                             signInButtonTitle: .localized(.signInButtonTitle),
                                             signUpButtonTitle: .localized(.signUpButtonTitle),
                                             onSignInTap: onSignInTap,
                                             onSignUpTap: onSignUpTap)
    }
}

// MARK: - Actions
private extension SignInPresenter {

    func onSignInTap() {
        interactor.login()
    }

    func onSignUpTap() {
        output.signInModuleDidTapOnSignUp()
    }
}
