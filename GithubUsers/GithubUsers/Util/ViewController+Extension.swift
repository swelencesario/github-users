//
//  ErrorAlert+Extension.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 15/09/24.
//

import UIKit

extension UIViewController {
    func callErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
