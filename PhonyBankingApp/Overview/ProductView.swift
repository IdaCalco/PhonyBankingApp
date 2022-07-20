//
//  PaymentAccountView.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 06/07/2022.
//

import Foundation
import UIKit

final class ProductView: UIView {
    
    // MARK: - Associated types & constants
    
    // TODO: Add stack view as well, just like in OverviewView
    // TODO: Play with debug view hierachy 
    
    private enum Constants {
        static let padding: CGFloat = 6
        static let fontSizeLabelLarge: CGFloat = 18
        static let fontSizeLabelSmall: CGFloat = 16
        static let defaultCornerRadius: CGFloat = 5
        static let buttonBorderWidth: CGFloat = 2
    }
    
    // MARK: - Private properties
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.fontSizeLabelLarge, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let productHolderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.fontSizeLabelSmall, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.fontSizeLabelSmall, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    // MARK: Object Lifecycle
    
    init(productName: String, productHolder: String, amount: String?) {
        super.init(frame: .zero)
        
        productNameLabel.text = productName
        productHolderLabel.text = productHolder
        amountLabel.text = amount
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    
    private func setupViews() {
        // Add views to hierarchy
        addSubviews(productNameLabel, amountLabel, productHolderLabel)
    }
    
    // TODO: This can all be deleted, only constraint for stackview needed
    private func setupConstraints() {
        // Layout views
        NSLayoutConstraint.activate([
            productHolderLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding),
            productHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Constants.padding),
            productHolderLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -Constants.padding),
            
            amountLabel.topAnchor.constraint(equalTo: productHolderLabel.bottomAnchor, constant: Constants.padding),
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Constants.padding),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -Constants.padding),
            
            productNameLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: Constants.padding),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Constants.padding),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -Constants.padding),
            productNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.padding)
        ])
        
        // TODO: Put this at the top
        // TODO: Try to understand what this is exactly
//        productHolderLabel.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
//        productHolderLabel.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
//        
//        amountLabel.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
//        amountLabel.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
//
//        productNameLabel.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
//        productNameLabel.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
    }
}
