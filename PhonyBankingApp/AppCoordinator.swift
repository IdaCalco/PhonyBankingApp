//
//  AppCoordinator.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 08/07/2022.
//

import Foundation
import UIKit

// TODO: Create folders within the PhonyBankingApp folder to make it easier to navigate/find classes.

final class AppCoordinator: LoginViewControllerDelegate {
    
    // MARK: Private properties

    private let navigationController: UINavigationController
    
    private var loginViewController: LoginViewController?
    private var overviewViewController: OverviewViewController?
    
    // MARK: - Object Lifecycle
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal methods
    func start() {
        let loginViewController = LoginViewController()
        self.loginViewController = loginViewController
        loginViewController.delegate = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToOverview() {
        let overviewViewController = OverviewViewController()
        self.overviewViewController = overviewViewController
        //overviewViewController.delegate = self
        overviewViewController.navigationItem.hidesBackButton = true
        navigationController.pushViewController(overviewViewController, animated: true)
    }

}

/*
 
 Future ideas:
 
 ---------------
 
 Now when we go from the login screen to the overview screen, we're able to go back to the login screen
 This is not something we want. How can we fix that?
 TODO: Make sure the user is not able to navigate back to the login screen (+ create log out button).
 
 ---------------
 
 */
