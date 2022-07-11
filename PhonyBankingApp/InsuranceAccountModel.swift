//
//  InsuranceAccountModel.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 07/07/2022.
//

import Foundation
import UIKit

enum InsuranceAccountType: String {
    case legalInsurance = "Legal insurance NN"
    case contentsInsurance = "Contents insurance Univé"
    
    func getColor() -> UIColor {
        switch self {
        case .legalInsurance:
            return .blue
            
        case .contentsInsurance:
            return .purple
        }
    }
}

class InsuranceAccount {
    var insuranceName: String
    var backgroundColor: UIColor
    
    init(insuranceName: String, backgroundColor: UIColor) {
        self.insuranceName = insuranceName
        self.backgroundColor = backgroundColor
    }
    
    public static func getInsuranceDetails(for type: InsuranceAccountType) -> InsuranceAccount {
        return InsuranceAccount(
            insuranceName: type.rawValue.capitalized,
            backgroundColor: type.getColor()
        )
    }
}

