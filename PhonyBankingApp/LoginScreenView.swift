//
//  LoginScreenView.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import Foundation
import UIKit

extension LoginScreenViewController {
    
    func setupLoginContentView() {
        view.addSubview(loginContentView)
        loginContentView.addSubview(usernameLabel)
        loginContentView.addSubview(usernameTextField)
        loginContentView.addSubview(passwordTextField)
        loginContentView.addSubview(loginButton)
        loginContentView.translatesAutoresizingMaskIntoConstraints = false //set this for Auto Layout to work!
        loginContentView.heightAnchor.constraint(
            equalToConstant: view.frame.height/3).isActive = true
        loginContentView.leftAnchor.constraint(
            equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(
            equalTo: view.rightAnchor).isActive = true
        loginContentView.centerYAnchor.constraint(
            equalTo: view.centerYAnchor).isActive = true
        setupUsernameTextField()
        setupUsernameLabel()
        setupPasswordTextField()
        setupLoginButton()
    }
    
    func setupUsernameLabel() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.isUserInteractionEnabled = true
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        usernameLabel.frame.size.width = 200
        usernameLabel.frame.size.height = 20
        usernameLabel.topAnchor.constraint(
            equalTo: loginContentView.topAnchor,
            constant: 40).isActive = true
        usernameLabel.centerXAnchor.constraint(
            equalTo: loginContentView.centerXAnchor).isActive = true
        usernameLabel.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        usernameLabel.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    func setupUsernameTextField() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.isUserInteractionEnabled = true
        usernameTextField.backgroundColor = .white
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        usernameTextField.frame.size.width = 200
        usernameTextField.frame.size.height = 20
        usernameTextField.topAnchor.constraint(
            equalTo: usernameLabel.bottomAnchor,
            constant: 0).isActive = true
        usernameTextField.centerXAnchor.constraint(
            equalTo: loginContentView.centerXAnchor).isActive = true
        usernameTextField.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        usernameTextField.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isUserInteractionEnabled = true
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.frame.size.width = 200
        passwordTextField.frame.size.height = 20
        passwordTextField.topAnchor.constraint(
            equalTo: usernameTextField.bottomAnchor,
            constant: 40).isActive = true
        passwordTextField.centerXAnchor.constraint(
            equalTo: loginContentView.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(
            equalToConstant: 40).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.isUserInteractionEnabled = true
        loginButton.backgroundColor = .white
        loginButton.frame.size.width = 100
        loginButton.frame.size.height = 30
        loginButton.topAnchor.constraint(
            equalTo: passwordTextField.bottomAnchor,
            constant: 40).isActive = true
        loginButton.centerXAnchor.constraint(
            equalTo: loginContentView.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(
            equalToConstant: 100).isActive = true
        loginButton.heightAnchor.constraint(
            equalToConstant: 30).isActive = true
    }
}
