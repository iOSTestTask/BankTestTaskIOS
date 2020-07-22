//
//  SignUpViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Eureka

final class SignUpViewController: FormViewController, StoryboardLoadable {

    var output: SignUpViewOutput!

    // MARK: - Private properties
    private var onCloseTap: (() -> ())?
    private var onSignUpTap: (() -> ())?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

// MARK: - SignUpViewInput
extension SignUpViewController: SignUpViewInput {

    func setupInitialState(_ viewState: SignUpViewControllerViewState) {
        onCloseTap = viewState.onCloseTap
        onSignUpTap = viewState.onSignUpTap

        setupForm(viewState)
    }
}

// MARK: - Private
// MARK: - Fill form
private extension SignUpViewController {
    func addEmailRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let emailRow = EmailRow() {
            $0.title = viewState.emailRow
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleEmail())
            $0.validationOptions = .validatesOnDemand

            #if DEBUG
                $0.value = StubData.email
            #endif
        }.cellUpdate { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }.onRowValidationChanged {[weak self] cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }

            self?.output.viewDidEndFillingEmail(row.value)
        }

        section.append(emailRow)
    }

    func addPasswordRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let passwordRow = PasswordRow() {
            $0.title = viewState.paswordRow
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleMinLength(minLength: 6))
            #if DEBUG
                $0.value = StubData.password
            #endif
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }.onRowValidationChanged { [weak self] cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }

            self?.output.viewDidEndFillingPassword(row.value)
        }

        section.append(passwordRow)
    }

    func addFirstNameRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let nameRow = NameRow() {
            $0.title = viewState.firstNameRow
            $0.add(rule: RuleRequired())
            #if DEBUG
                $0.value = StubData.firstName
            #endif
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }.onRowValidationChanged { [weak self] cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }

            self?.output.viewDidEndFillingFirstName(row.value)
        }

        section.append(nameRow)
    }

    func addLastNameRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let nameRow = NameRow() {
            $0.title = viewState.lastNameRow
            $0.add(rule: RuleRequired())
            #if DEBUG
                $0.value = StubData.lastName
            #endif
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { cell, row in
            if !row.isValid {
                cell.titleLabel?.textColor = .red
            }
        }.onRowValidationChanged { [weak self] cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map({ $0.msg }).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }

            self?.output.viewDidEndFillingLastName(row.value)
        }

        section.append(nameRow)
    }

    func addPhoneNameRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let phoneRow = PhoneRow() {
            $0.title = viewState.phoneRow
            #if DEBUG
                $0.value = StubData.phone
            #endif
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in
            if row.isValid {
                self.output.viewDidEndFillingPhoneNumber(row.value)
            }
        }

        section.append(phoneRow)
    }

    func addDateRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let phoneRow = DateRow() {
            $0.title = viewState.dateOfBirth
            #if DEBUG
                $0.value = StubData.dob
            #endif
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in
            if row.isValid {
                self.output.viewDidEndFillingDate(row.value)
            }
        }

        section.append(phoneRow)
    }

    func addGenderRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let genderRow = SegmentedRow<String>(viewState.genderTitle) {
            $0.options = viewState.genderOptions
            #if DEBUG
                $0.value = StubData.gender.rawValue
            #else
                $0.value = viewState.genderDefaultOption
            #endif

        }.onCellSelection { (cell, row) in
            if let value = row.value, let gender = Gender.init(rawValue: value) {
                self.output.viewDidFillingGender(gender)
            }
        }

        section.append(genderRow)
    }

    func addSinUpRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let signInRow = ButtonRow() {
            $0.title = viewState.signUpButtonTitle
            $0.cell.selectionStyle = .none
            $0.cell.height = { 60 }
        }
        .onCellSelection { [unowned self] cell, row in

            if self.form.validate().isEmpty {
                self.onSignUpTap?()
            }
        }

        section.append(signInRow)
    }

    func addCloseRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let signUpRow = ButtonRow() {
            $0.title = viewState.closeButtonTitle
            $0.cell.selectionStyle = .none
            $0.cell.height = { 60 }
        }
        .onCellSelection { [unowned self] cell, row in
            self.onCloseTap?()
        }

        section.append(signUpRow)
    }

    func setupForm(_ viewState: SignUpViewControllerViewState) {
        let requiredFieldsSection = Section()

        addEmailRow(to: requiredFieldsSection, viewState)
        addPasswordRow(to: requiredFieldsSection, viewState)
        addFirstNameRow(to: requiredFieldsSection, viewState)
        addLastNameRow(to: requiredFieldsSection, viewState)

        let nonRequiredFieldsSection = Section()
        addPhoneNameRow(to: nonRequiredFieldsSection, viewState)
        addDateRow(to: nonRequiredFieldsSection, viewState)
        addGenderRow(to: nonRequiredFieldsSection, viewState)

        let buttonsSections = Section()
        addSinUpRow(to: buttonsSections, viewState)
        addCloseRow(to: buttonsSections, viewState)

        form.append(contentsOf: [requiredFieldsSection, nonRequiredFieldsSection, buttonsSections])
    }
}
