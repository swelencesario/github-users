//
//  WebViewController.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 18/09/24.
//

import UIKit

class WebViewController: UIViewController {
    let webView = WebView()
    let coordinator: MainCoordinator?
    var userProfileURL: String
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebView()
    }
    
    override func loadView() {
        self.view = webView
    }
    
    init(userProfileURL: String, coordinator: MainCoordinator?) {
        self.userProfileURL = userProfileURL
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadWebView() {
        let url: URL? = URL(string: userProfileURL)
        
        if let url = url {
            self.webView.load(url: url)
            webView.webView.allowsBackForwardNavigationGestures = true
        }
    }
 
}
