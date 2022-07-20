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
    
//    var currentAccount1: ProductView = {
//        let currentAccount = ProductView(productName: "Test", productHolder: "Test naam", amount: "100 euro")
//        return currentAccount
//    }()
////
//    var currentAccount2: ProductView = {
//        let currentAccount = ProductView()
//        return currentAccount
//    }()
//    var insurance1: ProductView = {
//        let insurance = ProductView()
//        return insurance
//    }()
//    var insurance2: ProductView = {
//        let insurance = ProductView()
//        return insurance
//    }()

    // TODO: UIStackView voor product views aanmaken
    private let productViews: [ProductView]
    
    // MARK: Object Lifecycle

    init(productViews: [ProductView]) {
        self.productViews = [ProductView(productName: "Test account", productHolder: "Test naam", amount: "100 euro"), ProductView(productName: "Test account2", productHolder: "Test naam2", amount: "200 euro")]
        super.init(frame: .zero)
        //setupProductViews()
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setupProductViews() {
//        //currentAccount1 =
//        productViews = [currentAccount1, currentAccount2, insurance1, insurance2]
//    }
//
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoutButton)
        addSubview(stackView)
    }
    
    // MARK: - Setting Constraints
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            // logout button
            logoutButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            logoutButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            
            // stack view
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: logoutButton.bottomAnchor),
            //stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            //stackView.heightAnchor.constraint(equalToConstant: viewFrame.height)
            
//
//            // current account 1
//            currentAccount1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            currentAccount1.topAnchor.constraint(equalTo: logoutButton.bottomAnchor),
//            currentAccount1.widthAnchor.constraint(equalToConstant: viewFrame.width),
//            currentAccount1.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
//
//            // current account 2
//            currentAccount2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            currentAccount2.topAnchor.constraint(equalTo: currentAccount1.bottomAnchor),
//            currentAccount2.widthAnchor.constraint(equalToConstant: viewFrame.width),
//            currentAccount2.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
//            currentAccount2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//            // insurance 1
//            insurance1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            insurance1.topAnchor.constraint(equalTo: currentAccount2.bottomAnchor),
//            insurance1.widthAnchor.constraint(equalToConstant: viewFrame.width),
//            insurance1.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
//            insurance1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//            // insurance 2
//            insurance2.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//            insurance2.topAnchor.constraint(equalTo: insurance1.bottomAnchor),
//            insurance2.widthAnchor.constraint(equalToConstant: viewFrame.width),
//            insurance2.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
//            insurance2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            insurance2.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}


// MARK: - View Configuration


//// dit naar viewcontroller
//extension OverviewView {
//    public func configurePaymentAccount(with type: PaymentAccountType) {
//        let model = PaymentAccount.getPaymentAccountDetails(for: type)
//        productHolderLabel.text = model.accountHolder
//        amountLabel.text = model.accountAmount
//        backgroundColor = model.backgroundColor
//    }
//    
//    public func configureInsuranceAccount(with type: InsuranceAccountType) {
//        let model = InsuranceAccount.getInsuranceDetails(for: type)
//        productNameLabel.text = model.insuranceName
//        backgroundColor = model.backgroundColor
//    }
//}

