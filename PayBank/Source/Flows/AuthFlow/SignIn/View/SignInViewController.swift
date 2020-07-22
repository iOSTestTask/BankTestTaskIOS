//
//  SignInViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Eureka

final class SignInViewController: FormViewController, StoryboardLoadable {

    var output: SignInViewOutput!

    // MARK: - Private
    private var onSignInTap: (() -> ())?
    private var onSignUpTap: (() -> ())?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - SignInViewInput
extension SignInViewController: SignInViewInput {

    func setupInitialState(_ viewState: SignInViewControllerViewState) {

        onSignInTap = viewState.onSignInTap
        onSignUpTap = viewState.onSignUpTap

        setupForm(viewState)
    }
}

private extension SignInViewController {

    func setupForm(_ viewState: SignInViewControllerViewState) {

        let fieldsSection = Section()

        addEmailRow(to: fieldsSection, viewState)
        addPasswordRow(to: fieldsSection, viewState)

        let buttonsSections = Section()
        addSignInRow(to: buttonsSections, viewState)
        addSinUpRow(to: buttonsSections, viewState)

        form.append(contentsOf: [fieldsSection, buttonsSections])
    }

    // FIXME: Add custom cells and setup them with cell state
    // FIXME: Replace validation rows with inline row
    func addEmailRow(to section: Section, _ viewState: SignInViewControllerViewState) {
        let emailRow = EmailRow() {
            $0.title = viewState.emailRow
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleEmail())
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in

            self.output.viewDidEndFillingEmail(row.value)
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

        section.append(emailRow)
    }

    func addPasswordRow(to section: Section, _ viewState: SignInViewControllerViewState) {
        let passwordRow = PasswordRow() {
            $0.title = viewState.paswordRow
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleMinLength(minLength: 6))
            $0.validationOptions = .validatesOnDemand
        }.cellUpdate { [unowned self] cell, row in

            self.output.viewDidEndFillingPassword(row.value)
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

        section.append(passwordRow)
    }

    func addSignInRow(to section: Section, _ viewState: SignInViewControllerViewState) {
        let signInRow = ButtonRow() {
            $0.title = viewState.signInButtonTitle
            $0.cell.selectionStyle = .none
            $0.cell.height = { 60 }
        }
        .onCellSelection { [unowned self] cell, row in

            if self.form.validate().isEmpty {
                self.onSignInTap?()
            }
        }

        section.append(signInRow)
    }

    func addSinUpRow(to section: Section, _ viewState: SignInViewControllerViewState) {
        let signUpRow = ButtonRow() {
            $0.title = viewState.signUpButtonTitle
            $0.cell.selectionStyle = .none
            $0.cell.height = { 60 }
        }
        .onCellSelection { [unowned self] cell, row in
            self.onSignUpTap?()
        }

        section.append(signUpRow)
    }
}
