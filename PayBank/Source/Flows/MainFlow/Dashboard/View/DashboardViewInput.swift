//
//  DashboardViewInput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

protocol DashboardViewInput: class {

    func setupInitialState(_ viewState: DashboardViewControllerViewState)

    func setup(_ sectionsState: [DashboardDataSectionState])

    func showOverNavigationBar(error: String)
}
