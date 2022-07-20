//
//  PaymentAccountModel.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 06/07/2022.
//

import Foundation
import UIKit

// MARK: - Payment account type string

enum PaymentAccountType: String {
    case singleAccount = "Mw I Segond von Banchet"
    case jointAccount = "Mw I Segond von Banchet, Hr S"
    
    func getAmount() -> String {
        switch self {
        case .singleAccount:
            let accountAmount = 22.45
            let accountAmountText = "€" + accountAmount.description
            return accountAmountText
            
        case .jointAccount:
            let accountAmount = 352.12
            let accountAmountText = "€" + accountAmount.description
            return accountAmountText
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .singleAccount:
            return .green
            
        case .jointAccount:
            return .orange
        }
    }
}

class PaymentAccount {
    
    // MARK: - Internal properties
    
    var accountHolder: String
    let accountAmount: String
    var backgroundColor: UIColor
    
    // MARK: - Object lifecycle
    
    init(accountHolder: String, accountAmount: String, backgroundColor: UIColor) {
        self.accountHolder = accountHolder
        self.accountAmount = accountAmount
        self.backgroundColor = backgroundColor
    }
    
    // MARK: - Public functions
    
    public static func getPaymentAccountDetails(for type: PaymentAccountType) -> PaymentAccount {
        return PaymentAccount(
            accountHolder: type.rawValue.capitalized,
            accountAmount: type.getAmount(),
            backgroundColor: type.getColor())
    }
}
