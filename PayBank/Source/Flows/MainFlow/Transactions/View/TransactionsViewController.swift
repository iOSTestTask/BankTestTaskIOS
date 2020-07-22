//
//  TransactionsViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Eureka

final class TransactionsViewController: FormViewController, StoryboardLoadable {

    var output: TransactionsViewOutput!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

// MARK: - TransactionsViewInput
extension TransactionsViewController: TransactionsViewInput {

    func setupInitialState(_ viewState: TransactionsViewControllerViewState) {
        tabBarItem.title = viewState.tabbarTitle
        title = viewState.navigationTitle

        let logoutItem = UIBarButtonItem(title: viewState.logoutButtonTitle,
                                         style: .plain,
                                         target: self,
                                         action: #selector(logoutTapped))
        navigationItem.rightBarButtonItems = [logoutItem]
    }

    func setup(_ sectionsState: [TransactionsSectionState]) {

        form.removeAll()

        for section in sectionsState {
            switch section {
            case .data(let sectionState):
                let formSection = Section()

                switch sectionState {
                case .emptyResult(let cellState):
                    addNoResultsRow(to: formSection, cellState)
                case .transactions(let cellStates):
                    addTransactionsRows(to: formSection, cellStates)
                }

                form.append(formSection)
            }
        }
    }
}

// MARK: - Private
private extension TransactionsViewController {

    func addTransactionsRows(to section: Section, _ cellStates: [TransactionCellState]) {

        cellStates.enumerated().forEach { (index, value) in
            section
                <<< TransactionRow(nil, { row in
                    row.value = value
                })
        }
    }

    func addNoResultsRow(to section: Section, _ cellState: NoResultCellState) {
        section
            <<< NoResultRow(nil, { row in
                row.value = cellState
            })
    }

    @objc func logoutTapped() {
        output.viewOnLogoutTappedAction()
    }
}
