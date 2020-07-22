//
//  DashboardViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Eureka

final class DashboardViewController: FormViewController, StoryboardLoadable {

    var output: DashboardViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }
}

// MARK: - DashboardViewInput
extension DashboardViewController: DashboardViewInput {

    func setupInitialState(_ viewState: DashboardViewControllerViewState) {
        tabBarItem.title = viewState.tabbarTitle
        title = viewState.navigationTitle
    }

    func setup(_ sectionsState: [DashboardDataSectionState]) {
        form.removeAll()

        for section in sectionsState {

            switch section {
            case .emptyResult(let cellState):
                let formSection = Section()
                addNoResultsRow(to: formSection, cellState)
                form.append(formSection)
            case .cashExpences(let cellStates):
                let formSection = Section(cellStates.title)
                addMonthlyCashExpensesRows(to: formSection, cellStates.items)
                form.append(formSection)
            }
        }
    }
}

// MARK: - Private
private extension DashboardViewController {

    func addMonthlyCashExpensesRows(to section: Section, _ cellStates: [MontlyCashExpensesCellState]) {

        cellStates.enumerated().forEach { (index, value) in
            section
                <<< MontlyCashExpensesRow(nil, { row in
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
}
