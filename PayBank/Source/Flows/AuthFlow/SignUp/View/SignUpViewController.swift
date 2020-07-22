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

    func setupForm(_ viewState: SignUpViewControllerViewState) {

        form.inlineRowHideOptions = InlineRowHideOptions.AnotherInlineRowIsShown.union(.FirstResponderChanges)

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

    // FIXME: Add custom cells and setup them with cell state
    func addEmailRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let emailRow = EmailRow() {
            $0.title = viewState.emailRow
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleEmail())
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in

            self.output.viewDidEndFillingEmail(row.value)
        }.onRowValidationChanged { cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map(\.msg).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }.cellUpdate { cell, row in
                        cell.textLabel?.textColor = .red
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }
        }

        section.append(emailRow)
    }

    func addPasswordRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let passwordRow = PasswordRow() {
            $0.title = viewState.paswordRow
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleMinLength(minLength: 6))
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in

            self.output.viewDidEndFillingPassword(row.value)
        }.onRowValidationChanged { cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map(\.msg).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }.cellUpdate { cell, row in
                        cell.textLabel?.textColor = .red
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }
        }

        section.append(passwordRow)
    }

    func addFirstNameRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let nameRow = NameRow() {
            $0.title = viewState.firstNameRow
            $0.add(rule: RuleRequired())
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in

            self.output.viewDidEndFillingFirstName(row.value)
        }.onRowValidationChanged { cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map(\.msg).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }.cellUpdate { cell, row in
                        cell.textLabel?.textColor = .red
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }
        }

        section.append(nameRow)
    }

    func addLastNameRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let nameRow = NameRow() {
            $0.title = viewState.lastNameRow
            $0.add(rule: RuleRequired())
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in

            self.output.viewDidEndFillingLastName(row.value)
        }.onRowValidationChanged {cell, row in
            let rowIndex = row.indexPath!.row
            while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                row.section?.remove(at: rowIndex + 1)
            }
            if !row.isValid {
                for (index, validationMsg) in row.validationErrors.map(\.msg).enumerated() {
                    let labelRow = LabelRow() {
                        $0.title = validationMsg
                        $0.cell.height = { 40 }
                    }.cellUpdate { cell, row in
                        cell.textLabel?.textColor = .red
                    }
                    let indexPath = row.indexPath!.row + index + 1
                    row.section?.insert(labelRow, at: indexPath)
                }
            }
        }

        section.append(nameRow)
    }

    func addPhoneNameRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let phoneRow = PhoneRow() {
            $0.title = viewState.phoneRow
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in
            self.output.viewDidEndFillingPhoneNumber(row.value)
        }

        section.append(phoneRow)
    }

    func addDateRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let phoneRow = DateInlineRow() {
            $0.title = viewState.dateOfBirth
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in
            self.output.viewDidEndFillingDate(row.value)
        }

        section.append(phoneRow)
    }

    func addGenderRow(to section: Section, _ viewState: SignUpViewControllerViewState) {
        let genderRow = PickerInlineRow<String>() {
            $0.title = viewState.genderTitle
            $0.options = viewState.genderOptions ?? []
        }.cellUpdate { [unowned self] cell, row in
            guard
                let value = row.value, let gender = Gender(rawValue: value) else { return }
            self.output.viewDidFillingGender(gender)
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
}
