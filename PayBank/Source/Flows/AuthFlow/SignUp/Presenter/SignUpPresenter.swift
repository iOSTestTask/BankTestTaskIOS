//
//  SignUpPresenter.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation
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

        let initionlaViewState = makeInitionalViewState()
        view.setupInitialState(initionlaViewState)
    }

    func viewDidEndFillingEmail(_ email: String?) {
        interactor.updateEmail(email)
    }

    func viewDidEndFillingPassword(_ password: String?) {
        interactor.updatePassword(password)
    }

    func viewDidEndFillingFirstName(_ firstName: String?) {
        interactor.updateFirstName(firstName)
    }

    func viewDidEndFillingLastName(_ lastName: String?) {
        interactor.updateLastName(lastName)
    }

    func viewDidEndFillingPhoneNumber(_ phoneNumber: String?) {
        interactor.updatePhone(phoneNumber)
    }

    func viewDidEndFillingDate(_ date: Date?) {
        interactor.updateDateOfBirth(date)
    }

    func viewDidFillingGender(_ gender: Gender) {
        interactor.updateGender(gender)
    }
}

// MARK: - SignUpInteractorOutput
extension SignUpPresenter: SignUpInteractorOutput {

    func interactorDidSignUp() {
        output.signInModuleDidSignUp()
    }

    func interactorDidFailSignUp(_ errorDescription: String) {
        view.showOverNavigationBar(error: errorDescription)
    }
}

// MARK: - View States
private extension SignUpPresenter {
    func makeInitionalViewState() -> SignUpViewControllerViewState {

        return SignUpViewControllerViewState(emailRow: .localized(.signUpEmailTitle),
                                             paswordRow: .localized(.signUpPasswordTitle),
                                             firstNameRow: .localized(.signUpFirstNameTitle),
                                             lastNameRow: .localized(.signUpLastNameTitle),
                                             phoneRow: .localized(.signUpPhoneTitle),
                                             dateOfBirth: .localized(.signUpDateOfBirthTitle),
                                             genderTitle: .localized(.signUpGenderTitle),
                                             genderOptions: [Gender.female.rawValue, Gender.male.rawValue, Gender.unknown.rawValue],
                                             genderDefaultOption: Gender.unknown.rawValue,
                                             closeButtonTitle: .localized(.closeInButtonTitle),
                                             signUpButtonTitle: .localized(.signUpButtonTitle),
                                             onSignUpTap: onSignUpTap,
                                             onCloseTap: onCloseTap)
    }
}

// MARK: - Actions
private extension SignUpPresenter {
    func onCloseTap() {
        output.signUpModuleDidTapClose()
    }

    func onSignUpTap() {
        interactor.signUp()
    }
}
