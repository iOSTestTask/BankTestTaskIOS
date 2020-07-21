//
//  DashboardPresenter.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

class DashboardPresenter {

    weak var view: DashboardViewInput!
    var interactor: DashboardInteractorInput!
    var router: DashboardRouterInput!
    weak var output: DashboardModuleOutput!
}

// MARK: - DashboardModuleInput
extension DashboardPresenter: DashboardModuleInput {}

// MARK: - DashboardViewOutput
extension DashboardPresenter: DashboardViewOutput {

    func viewIsReady() {

         let viewInitionalState = makeViewInitionalState()
        view.setupInitialState(viewInitionalState)

        interactor.fetchCashExpenses()
    }
}

// MARK: - DashboardInteractorOutput
extension DashboardPresenter: DashboardInteractorOutput {
    func intercatorDidFetchCashExpenses(_ cashExpencses: [MonthlyCashExpense]) {
        let sectionsState = makeDashoboardData(cashExpencses)
        view.setup(sectionsState)
    }

    func interactorDidFailLoadCashExpenses(_ errorDescription: String) {
        view.showOverNavigationBar(error: errorDescription)
    }
}

// MARK: - Private
private extension DashboardPresenter {
    func makeViewInitionalState() -> DashboardViewControllerViewState {
        return DashboardViewControllerViewState(navigationTitle: .localized(.dashboardNavigationTitle),
                                                tabbarTitle: .localized(.dashboardTabbarTitle))
    }

    func makeNoResultsCellState() -> NoResultCellState {
        return NoResultCellState(message: .localized(.noResults))
    }

    func makeCashExpensesCellState(_ cashExpences: [CashExpense]) -> [MontlyCashExpensesCellState] {
        return cashExpences.map {
            MontlyCashExpensesCellState(amount: String(format: "%.2f", $0.amount), category: $0.category)
        }
    }

    func makeDashboardCashExpensesSectionState(_ montlyCashExpences: [MonthlyCashExpense]) -> [DashoboardCashExpencesSectionState] {
        return montlyCashExpences.map {
            let date = interactor.makeShortString($0.date)
            let items = makeCashExpensesCellState($0.cashGroups)
            return DashoboardCashExpencesSectionState(title: date, items: items)
        }
    }

    func makeDashoboardData(_ montlyCashExpences: [MonthlyCashExpense]) -> [DashboardDataSectionState] {
        var sectionsStates = [DashboardDataSectionState]()

        if montlyCashExpences.isEmpty {
            sectionsStates.append(.emptyResult(makeNoResultsCellState()))
        } else {

            let dataSections = makeDashboardCashExpensesSectionState(montlyCashExpences)

            dataSections.enumerated().forEach { (index, value) in
                sectionsStates.append(.cashExpences(value))
            }
        }

        return sectionsStates
    }
}
