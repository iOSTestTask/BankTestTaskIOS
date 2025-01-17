//
//  SignInInteractorOutput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

import Foundation

protocol SignInInteractorOutput: class {

    func interactorDidLogin()

    func interactorDidFailLogin(_ errorDescription: String)
}
