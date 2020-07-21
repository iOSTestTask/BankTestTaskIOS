//
//  SignInViewOutput.swift
//  PayBank
//
//  Created by Anna Pomazanova on 20/07/2020.
//  Copyright © 2020 NIX. All rights reserved.
//

protocol SignInViewOutput {

    func viewIsReady()

    func viewDidEndFillingEmail(_ email: String?)

    func viewDidEndFillingPassword(_ password: String?)
}
