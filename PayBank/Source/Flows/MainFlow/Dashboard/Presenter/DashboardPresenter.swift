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
        view.setupInitialState()
    }
}

// MARK: - DashboardInteractorOutput
extension DashboardPresenter: DashboardInteractorOutput {}
