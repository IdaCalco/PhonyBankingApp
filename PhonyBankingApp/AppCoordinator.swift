//
//  AppCoordinator.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 08/07/2022.
//

import Foundation
import UIKit

final class AppCoordinator: LoginScreenViewControllerDelegate {
    
    private let navigationController: UINavigationController
    
    private var loginScreenViewController: LoginScreenViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Start login flow
    func start() {
        let loginScreenViewController = LoginScreenViewController()
        self.loginScreenViewController = loginScreenViewController
        loginScreenViewController.delegate = self
        navigationController.pushViewController(loginScreenViewController, animated: true)
    }
    
    func goToOverview() {
        let overviewViewController = OverviewViewController()
        navigationController.pushViewController(overviewViewController, animated: true)
    }

}
