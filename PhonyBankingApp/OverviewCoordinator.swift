//
//  OverviewCoordinator.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 11/07/2022.
//

import Foundation
import UIKit

final class OverviewCoordinator: OverviewViewControllerDelegate {
    
    private let navigationController: UINavigationController
    
    private var overviewViewController: OverviewViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToAccountOverview() {
        // Should lead to viewcontroller yet to be made to show the selected account
        let overviewViewController = OverviewViewController()
        self.overviewViewController = overviewViewController
        overviewViewController.delegate = self
    }

}
