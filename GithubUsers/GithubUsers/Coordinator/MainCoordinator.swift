//
//  MainCoordinator.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//
import UIKit

public class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToDetailsScreen(userName: String, profileURL: String) {
        let vc = UserDetailsViewController(userName: userName, userProfileURL: profileURL, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func callWebView(profileURL: String) {
        let vc = WebViewController(userProfileURL: profileURL, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
