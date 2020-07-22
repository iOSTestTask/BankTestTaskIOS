//
//  TransactionsViewOutput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

protocol TransactionsViewOutput {

    /// Notify presenter that view is ready
    func viewIsReady()

    func viewOnLogoutTappedAction()
}
