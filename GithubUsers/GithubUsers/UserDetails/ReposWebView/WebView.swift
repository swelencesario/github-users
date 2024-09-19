//
//  WebView.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 18/09/24.
//

import UIKit
import WebKit

class WebView: UIView {
    
    lazy var webView: WKWebView = {
        let webViewConfiguration = WKWebViewConfiguration()
        webViewConfiguration.websiteDataStore = .nonPersistent()
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground
        
        addSubview(webView)
        webViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webViewConstraints() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: topAnchor),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
