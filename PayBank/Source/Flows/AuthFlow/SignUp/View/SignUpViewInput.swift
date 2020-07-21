//
//  SignUpViewInput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

protocol SignUpViewInput: class {

     func setupInitialState(_ viewState: SignUpViewControllerViewState)

     func showOverNavigationBar(error: String)
}
