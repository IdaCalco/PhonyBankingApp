//
//  LoginScreenView.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import UIKit

protocol LoginScreenViewDelegate: AnyObject {
    func didTapLoginButton()
}

final class LoginScreenView: UIView {
    
    enum Constants {
        static let defaultCornerRadius: CGFloat = 5
        static let defaultBorderWidth: CGFloat = 1
        static let buttonBorderWidth: CGFloat = 2
        static let buttonWidth: CGFloat = 100
        static let buttonHeight: CGFloat = 30
    }
    
    weak var delegate: LoginScreenViewDelegate?
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
    
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = PaddedTextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Constants.defaultCornerRadius
        textField.layer.borderWidth = Constants.defaultBorderWidth
        textField.layer.borderColor = UIColor.black.cgColor
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = PaddedTextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Constants.defaultCornerRadius
        textField.layer.borderWidth = Constants.defaultBorderWidth
        textField.layer.borderColor = UIColor.black.cgColor
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.backgroundColor = .white
        button.layer.cornerRadius = Constants.defaultCornerRadius
        button.layer.borderWidth = Constants.buttonBorderWidth
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(didTapLoginButton), for: UIControl.Event.touchUpInside)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapLoginButton() {
        delegate?.didTapLoginButton()
    }
    
    func setupView() {
        addSubview(loginLabel)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupUsernameTextField()
        setupLoginLabel()
        setupPasswordTextField()
        setupLoginButton()
    }
    
    func setupLoginLabel() {
        loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupUsernameTextField() {
        usernameTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor).isActive = true
        usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 40).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
//    
//    let constraints = [
//        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
//        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
//
//        cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//        
//        contentView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: Layout.contentViewTopSpacing),
//        contentView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
//        contentView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
//        
//        subview.view.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: subview.edgeInsets.top),
//        subview.view.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: subview.edgeInsets.left),
//        subview.view.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: subview.edgeInsets.bottom),
//        subview.view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: subview.edgeInsets.right)
//    ]
//    
//    NSLayoutConstraint.activate(constraints)
//}
    
}
