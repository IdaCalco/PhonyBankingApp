//
//  ViewController.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import UIKit

protocol LoginScreenViewControllerDelegate: AnyObject {
    func goToOverview()
}

final class LoginScreenViewController: UIViewController, LoginScreenViewDelegate {
    
    // MARK: - Internal properties
    
    weak var delegate: LoginScreenViewControllerDelegate?
    
    var loginScreenView: LoginScreenView?
    
    override func loadView() {
        self.loginScreenView = LoginScreenView()
        loginScreenView?.delegate = self
        view = loginScreenView
    }
    
    func didTapLoginButton(_ sender: LoginScreenView) {
        delegate?.goToOverview()
    }
    
}
