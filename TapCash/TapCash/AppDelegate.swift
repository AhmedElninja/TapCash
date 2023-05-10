//
//  AppDelegate.swift
//  TapCash
//
//  Created by Ahmed Alaa on 09/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // MARK: - Proprepties.
    var window: UIWindow?
    private let mainStoryboard: UIStoryboard = UIStoryboard(name: Storyboards.main, bundle: nil)

    // MARK: - Application Methods.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        handleRoot()
        return true
    }
    // MARK: - Public Methods.
    public func goToLogInVC() {
        let logInVC: LogInVC = mainStoryboard.instantiateViewController(withIdentifier: Views.logInVC) as! LogInVC
        let navigationController = UINavigationController.init(rootViewController: logInVC)
        self.window?.rootViewController = navigationController
    }
    /*
    public func goToProfileVC() {
        let profileVC: ProfileVC = mainStoryboard.instantiateViewController(withIdentifier: Views.profileVC) as! ProfileVC
        let navigationController = UINavigationController.init(rootViewController: profileVC)
        self.window?.rootViewController = navigationController
    }
     */
}
// MARK: - Private Methods.
extension AppDelegate {
    private func handleRoot() {
        if let userLoggedIn = UserDefaults.standard.object(forKey: UserDefultKeys.isUserloggedIn) as? Bool {
            if userLoggedIn {
                goToProfileVC()
            } else {
                goToLogInVC()
            }
        }
    }
}
