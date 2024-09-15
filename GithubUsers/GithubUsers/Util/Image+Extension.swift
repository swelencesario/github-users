//
//  Image+Extension.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 15/09/24.
//

import UIKit

extension UIImageView {
    func loadImageFromURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        task.resume()
    }
}
