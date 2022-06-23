//
//  ViewController.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//
// Login screen code is from the https://betterprogramming.pub/how-to-build-ios-uis-programmatically-e0c4be2c3f24 tutorial

import UIKit

class LoginScreenViewController: UIViewController {

    let loginContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Username"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Password"
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(
            self,
            action: #selector(loginButtonPressed),
            for: UIControl.Event.touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupLoginContentView()

    }
    
    // Login button navigates to overview screen
    // Followed this tutorial: https://www.youtube.com/watch?v=Ime8NK5NLgc
    @objc func loginButtonPressed(sender: UIButton!) {
        let rootViewController = OverviewViewController()
        rootViewController.title = "This is the overview"
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
}


