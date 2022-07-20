//
//  OverviewCoordinator.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 11/07/2022.
//

import Foundation
import UIKit

// TODO: This class is not used anywhere.
// Ida: I'm aware, but there is no use of it right now when there is no next screen, right?
final class OverviewCoordinator: OverviewViewControllerDelegate {
    func goToLogin(_ sender: OverviewViewController) {
    
    }
    
    private let navigationController: UINavigationController
    
    private var overviewViewController: OverviewViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToAccountOverview(_ sender: OverviewViewController) {
        // Should lead to viewcontroller yet to be made to show the selected account
        let overviewViewController = OverviewViewController()
        self.overviewViewController = overviewViewController
        overviewViewController.delegate = self
    }

}
