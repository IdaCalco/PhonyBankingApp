//
//  PaymentAccountView.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 06/07/2022.
//

import Foundation
import UIKit

// TODO: samen verder doornemen
final class PaymentAccountView: UIView {
    
    // TODO: You can put these in a "Constants" enum like we did in the other view classes.
    private let padding: CGFloat = 6
    private let fontSizeLabelLarge: CGFloat = 18
    private let fontSizeLabelSmall: CGFloat = 16
    
    private var textLabelAccountHolder = UILabel()
    private var textLabelAmount = UILabel()
    private var textLabelInsurance = UILabel()

    // TODO: These don't have to be public
    public convenience init(with type: PaymentAccountType) {
        self.init(frame: .zero)
        configurePaymentAccount(with: type)
    }
    
    public convenience init(with type: InsuranceAccountType) {
        self.init(frame: .zero)
        configureInsuranceAccount(with: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setLabelConstraints(type: textLabelAccountHolder, fontSize: fontSizeLabelLarge)
        setLabelConstraints(type: textLabelAmount, fontSize: fontSizeLabelSmall)
        setLabelConstraints(type: textLabelInsurance, fontSize: fontSizeLabelSmall)
        setupConstraints()
    }
    
    private func setupViews() {
        // add views to hierarchy
        addSubviews(textLabelAccountHolder, textLabelAmount, textLabelInsurance)
    }
    
    // TODO: This naming is deceiving, as you're not setting any constraints here. You're setting properties of the UILabel.
    // For consistency and readability you could consider to create the labels in the same way that we have in the LoginView.
    private func setLabelConstraints(type: UILabel, fontSize: CGFloat) {
        type.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        type.textAlignment = .left
        type.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        // layout views
        NSLayoutConstraint.activate([
            textLabelAccountHolder.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            textLabelAccountHolder.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            textLabelAccountHolder.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding)
        ])
        textLabelAccountHolder.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        textLabelAccountHolder.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        
        NSLayoutConstraint.activate([
            textLabelAmount.topAnchor.constraint(equalTo: textLabelAccountHolder.bottomAnchor, constant: padding),
            textLabelAmount.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            textLabelAmount.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding)
        ])
        textLabelAmount.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        textLabelAmount.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        
        // insurance
        NSLayoutConstraint.activate([
            textLabelInsurance.topAnchor.constraint(equalTo: textLabelAmount.bottomAnchor, constant: padding),
            textLabelInsurance.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            textLabelInsurance.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding)
        ])
        textLabelInsurance.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        textLabelInsurance.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
    }
}

// MARK: - View Configuration
extension PaymentAccountView {
    public func configurePaymentAccount(with type: PaymentAccountType) {
        let model = PaymentAccount.getPaymentAccountDetails(for: type)
        textLabelAccountHolder.text = model.accountHolder
        textLabelAmount.text = model.accountAmount
        backgroundColor = model.backgroundColor
    }
    
    public func configureInsuranceAccount(with type: InsuranceAccountType) {
        let model = InsuranceAccount.getInsuranceDetails(for: type)
        textLabelInsurance.text = model.insuranceName
        backgroundColor = model.backgroundColor
    }
}
