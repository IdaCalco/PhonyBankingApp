//
//  AppCoordinator.swift
//  PhonyBankingApp
//
//  Created by Segond von Banchet, I.G.C. (Ida Gerri Christina) on 08/07/2022.
//

import Foundation
import UIKit

// TODO: Create folders within the PhonyBankingApp folder to make it easier to navigate/find classes.
// As an example I've put all files related to login into one folder.

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

/*
 
 Future ideas:
 
 ---------------
 
 Now when we go from the login screen to the overview screen, we're able to go back to the login screen
 This is not something we want. How can we fix that?
 TODO: Make sure the user is not able to navigate back to the login screen (+ create log out button).
 
 ---------------
 
 */
