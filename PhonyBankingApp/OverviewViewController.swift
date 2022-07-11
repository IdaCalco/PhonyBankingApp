//
//  OverviewViewController.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import Foundation
import UIKit

protocol OverviewViewControllerDelegate: AnyObject {
    func goToAccountOverview()
}

final class OverviewViewController: UIViewController, OverviewViewControllerDelegate {
    // Waarom moet ik hier de foToAccountOverview schrijven en kan dat niet net als in de LoginScreenViewController alleen in de bovenstaande protocol?
    func goToAccountOverview() {
    
    }
    
    weak var delegate: OverviewViewControllerDelegate?

    private var currentAccount1: PaymentAccountView = {
        let currentAccount = PaymentAccountView(with: .singleAccount)
        currentAccount.translatesAutoresizingMaskIntoConstraints = false
        return currentAccount
    }()
    
    private var currentAccount2: PaymentAccountView = {
        let currentAccount = PaymentAccountView(with: .jointAccount)
        currentAccount.translatesAutoresizingMaskIntoConstraints = false
        return currentAccount
    }()
    
    private var insurance1: PaymentAccountView = {
        let insurance = PaymentAccountView(with: .legalInsurance)
        insurance.translatesAutoresizingMaskIntoConstraints = false
        return insurance
    }()
    
    private var insurance2: PaymentAccountView = {
        let insurance = PaymentAccountView(with: .contentsInsurance)
        insurance.translatesAutoresizingMaskIntoConstraints = false
        return insurance
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    // MARK: - Setting Views
    private func setupViews() {
        view.addSubviews(currentAccount1, currentAccount2, insurance1, insurance2)
    }
    
    // MARK: - Setting Constraints
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let viewFrame = view.bounds
        
        //current account 1
        NSLayoutConstraint.activate([
            currentAccount1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentAccount1.topAnchor.constraint(equalTo: safeArea.topAnchor),
            currentAccount1.widthAnchor.constraint(equalToConstant: viewFrame.width),
            currentAccount1.heightAnchor.constraint(equalToConstant: viewFrame.height/10)
        ])
        
        //current account 2
        NSLayoutConstraint.activate([
            currentAccount2.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            currentAccount2.topAnchor.constraint(equalTo: currentAccount1.bottomAnchor),
            currentAccount2.widthAnchor.constraint(equalToConstant: viewFrame.width),
            currentAccount2.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
            currentAccount2.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        //insurance 1
        NSLayoutConstraint.activate([
            insurance1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            insurance1.topAnchor.constraint(equalTo: currentAccount2.bottomAnchor),
            insurance1.widthAnchor.constraint(equalToConstant: viewFrame.width),
            insurance1.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
            insurance1.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        //insrance 2
        NSLayoutConstraint.activate([
            insurance2.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            insurance2.topAnchor.constraint(equalTo: insurance1.bottomAnchor),
            insurance2.widthAnchor.constraint(equalToConstant: viewFrame.width),
            insurance2.heightAnchor.constraint(equalToConstant: viewFrame.height/10),
            insurance2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            insurance2.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
