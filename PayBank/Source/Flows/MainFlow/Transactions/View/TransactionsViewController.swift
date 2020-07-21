//
//  TransactionsViewController.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import UIKit
import Eureka

struct TransactionsViewControllerViewState {

    var navigationTitle: String?

    var tabbarTitle: String?
}

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
    }
}
