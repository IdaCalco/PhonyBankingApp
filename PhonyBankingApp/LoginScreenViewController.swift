//
//  ViewController.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//
// Login screen code is from the https://betterprogramming.pub/how-to-build-ios-uis-programmatically-e0c4be2c3f24 tutorial

import UIKit

final class LoginScreenViewController: UIViewController, LoginScreenViewDelegate {
    
    var loginScreenView: LoginScreenView?
    
    override func loadView() {
        self.loginScreenView = LoginScreenView()
        loginScreenView?.delegate = self
        view = loginScreenView
    }
    
    func didTapLoginButton() {
        presentOverview()
    }
    
    func presentOverview() {
        let rootViewController = OverviewViewController()
        rootViewController.title = "This is the overview"
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
    
}
