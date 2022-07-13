//
//  LoginScreenView.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import UIKit

protocol LoginScreenViewDelegate: AnyObject {
    // TODO: I have added '_sender: LoginScreenView' to the function. This is also the way we define delegate methods in Bankieren. This way it's clear in the delegate class from where the method was triggered. It also gives you access to the LoginScreenView from the delegate method. Please add the same pattern in your other delegate methods.
    func didTapLoginButton(_ sender: LoginScreenView)
}

// In een final class kan je in principe wel bij variabelen en functies die niet private zijn, maar je kan ze niet aanpassen/overriden toch?
// ---> Je kan bij alle niet-private functies als je een instance van de class hebt gemaakt. Dus in het geval van deze class heb je access tot LoginScreenView().delegate. Je kan de class alleen niet subsclassen. Dus je kan niet een nieuwe class schrijven zoals dit: class AnotherLoginScreenView: LoginScreenView {}.
final class LoginScreenView: UIView {
    // TODO: I have added MARKs to this file following the developer reference style guide. Please do the same for all your other classes.
    
    // MARK: - Associated types & constants
    
    // TODO: I don't think you're using all of these. Please check what you need and remove the rest.
    private enum Constants {
        static let defaultCornerRadius: CGFloat = 5
        static let defaultBorderWidth: CGFloat = 1
        static let buttonBorderWidth: CGFloat = 2
        static let buttonWidth: CGFloat = 100
        static let buttonHeight: CGFloat = 30
    }
    
    // MARK: - Internal properties
    
    weak var delegate: LoginScreenViewDelegate?
    
    // MARK: - Private properties
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
    
        return label
    }()
    
    // Ik zou fot usernameTextfield, passwordTextField en loginButton een soort setConstraints functie kunnen schrijven net als
    // in PaymentAccountView, maar ik weet niet of dat het nou beter maakt. Het is korter, maar misschien iets minder duidelijk
    private let usernameTextField: UITextField = {
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
    
    private let passwordTextField: UITextField = {
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
    
    private var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.backgroundColor = .white
        button.layer.cornerRadius = Constants.defaultCornerRadius
        button.layer.borderWidth = Constants.buttonBorderWidth
        button.layer.borderColor = UIColor.black.cgColor
        // Waarom krijg ik deze compiler warning? -> 'self' refers to the method 'LoginScreenView.self', which may be unexpected
        // Wanneer ik 'LoginScreenView.self' gebruik om deze warning weg te krijgen kan ik niet meer naar het volgende scherm
        // ---> Maak de loginButton propery een "lazy var". Je krijgt deze waarschuwing omdat je "self" probeert te accessen voordat "self" volledig initialised is.
        // Door de property "lazy" te maken wordt de property pas gemaakt als je 'm voor het eerst gebruikt. Op dat moment is LoginScreenView (dus "self") al
        // geinitialiseerd (dus bestaat) en kan je "self" accessen.
        // TODO: Maak loginButton een lazy var.
        button.addTarget(self, action: #selector(didTapLoginButton), for: UIControl.Event.touchUpInside)

        return button
    }()
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(frame: .zero)
        setupView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - User actions
    
    @objc func didTapLoginButton() {
        delegate?.didTapLoginButton(self)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        addSubviews(loginLabel, usernameTextField, passwordTextField, loginButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        // TODO: You can put all constraints in the same NSLayoutConstraint array.
        
        NSLayoutConstraint.activate([
            // Login label
            loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLabel.widthAnchor.constraint(equalToConstant: 300),
            loginLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
            
        NSLayoutConstraint.activate([
            // Login button
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 30)
        ])
            
        NSLayoutConstraint.activate([
            // Username textfield
            usernameTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor),
            usernameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            // Password textfield
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 40),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
