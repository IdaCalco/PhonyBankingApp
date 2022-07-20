//
//  OverviewView.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 15/07/2022.
//

import Foundation
import UIKit

protocol OverviewViewDelegate: AnyObject {

}

final class OverviewView: UIView {
    
    // MARK: - Internal properties
    
    weak var delegate: OverviewViewDelegate?
    // lazy var to make object when needed
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: self.productViews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        // TODO: play with different distrubution types
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    // MARK: - Private properties
    //  TODO: Button is supposed to be visisble in different views later on. So maybe button should be in another class in the future
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.backgroundColor = .red
        button.layer.borderColor = UIColor.black.cgColor

        return button
    }()

    private let productViews: [ProductView]
    
    // MARK: Object Lifecycle

    init(productViews: [ProductView]) {
        self.productViews = [ProductView(productName: "Test account", productHolder: "Test naam", amount: "100 euro"), ProductView(productName: "Test account2", productHolder: "Test naam2", amount: "200 euro")]
        super.init(frame: .zero)

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(stackView)
        addSubview(logoutButton)
    }
    
    // MARK: - Setting Constraints
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            // logout button
            logoutButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoutButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 24),
            
            // stack view
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: logoutButton.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
