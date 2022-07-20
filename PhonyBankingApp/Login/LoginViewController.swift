//
//  ViewController.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func goToOverview()
}

final class LoginViewController: UIViewController, LoginViewDelegate {
    
    // MARK: - Internal properties
    
    weak var delegate: LoginViewControllerDelegate?
    
    var loginView: LoginView?
    
    override func loadView() {
        self.loginView = LoginView()
        loginView?.delegate = self
        view = loginView
    }
    
    func didTapLoginButton(_ sender: LoginView) {
        delegate?.goToOverview()
    }
    
}
