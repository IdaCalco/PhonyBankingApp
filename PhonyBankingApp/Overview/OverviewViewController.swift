//
//  OverviewViewController.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 23/06/2022.
//

import Foundation
import UIKit

protocol OverviewViewControllerDelegate: AnyObject {
    func goToAccountOverview(_ sender: OverviewViewController)
    func goToLogin(_ sender: OverviewViewController)
}

final class OverviewViewController: UIViewController, OverviewViewDelegate {

    weak var delegate: OverviewViewControllerDelegate?
    
    var overviewView: OverviewView?


    override func viewDidLoad() {
        super.viewDidLoad()
        //setupViews()
        view.backgroundColor = .white
    }
    
    override func loadView() {

        self.overviewView = OverviewView(productViews: [])
        overviewView?.delegate = self
        view = overviewView
    }
    
//    public func configurePaymentAccount(with type: PaymentAccountType) {
//        PaymentAccount.getPaymentAccountDetails(for: type)
//    }
//    
//    public func configureInsuranceAccount(with type: InsuranceAccountType) {
//        InsuranceAccount.getInsuranceDetails(for: type)
//    }
    
    // MARK: - Setting Views
    
//    func setupViews() {
//        view.addSubviews(productView1, productView2)
//    }

}
