//
//  UserDetailsViewController.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import UIKit

class UserDetailsViewController: UIViewController {
    var userName: String?
    var userProfileURL: String?
    var userDetailsView = UserDetailsView()
    let webView = WebView()
    let viewModel = UserDetailsViewModel()
    var repos = [TableCellViewModel]()
    var coordinator: MainCoordinator?
    
    init(userName: String, userProfileURL: String, coordinator: MainCoordinator?) {
        self.userName = userName
        self.userProfileURL = userProfileURL
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsView.tableView.dataSource = self
        userDetailsView.tableView.delegate = self
        
        bindUser()
        bindUserRepos()
        callError()
        
        guard let userName = userName else { return }
        viewModel.listUserRepos(user: userName)
        viewModel.findUser(user: userName)
    }
    
    override func loadView() {
        self.view = userDetailsView
        userDetailsView.profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
    }
    
    func bindUser() {
        viewModel.user.bind { [weak self] user in
            self?.userDetailsView.nameLabel.text = user?.login
            self?.userDetailsView.image.loadImageFromURL(urlString: user?.avatarURL ?? "")
        }
    }
    
    func bindUserRepos() {
        viewModel.cellViewModel.bind { [weak self] repos in
            guard let repos = repos else { return }
            self?.repos = repos
            self?.userDetailsView.tableView.reloadData()
        }
    }
    
    func callError() {
        viewModel.showError = { [weak self] in
            let title = NSLocalizedString("generic_error_title", tableName: "Localizable", bundle: .main, value: "", comment: "")
            let message = NSLocalizedString("generic_message_error", tableName: "Localizable", bundle: .main, value: "", comment: "")
            
            self?.callErrorAlert(title: title, message: message)
        }
    }
    
    @objc func goToProfile() {
        guard let profileURL = self.userProfileURL else { return }
        coordinator?.callWebView(profileURL: profileURL)
    }
}

extension UserDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserReposCell.identifier, for: indexPath) as? UserReposCell
        cell?.configCell(repo: repos[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
