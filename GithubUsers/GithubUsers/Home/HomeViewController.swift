//
//  ViewController.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    let coordinator: MainCoordinator?
    let homeView = HomeView()
    let viewModel = HomeViewModel()
    var users = [CollectionCellViewModel]()
    
    
    init(coordinator: MainCoordinator?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.collection.dataSource = self
        homeView.collection.delegate = self
        
        bindUsers()
        callError()
        viewModel.listAllUsers()
        
        title = "Github Users"
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    func bindUsers() {
        viewModel.cellViewModel.bind { [weak self] users in
            guard let users = users else { return }
            self?.users = users
            self?.homeView.collection.reloadData()
        }
    }
    
    func callError() {
        viewModel.showError = { [weak self] in
            let title = NSLocalizedString("generic_error_title", tableName: "Localizable", bundle: .main, value: "", comment: "")
            let message = NSLocalizedString("generic_message_error", tableName: "Localizable", bundle: .main, value: "", comment: "")
            
            self?.callErrorAlert(title: title, message: message)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
        cell?.configCell(cellData: users[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 24, height: 172)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let userName = users[indexPath.row].name,
            let userProfile = users[indexPath.row].profileURL {
            self.coordinator?.goToDetailsScreen(userName: userName, profileURL: userProfile)
        }
    }
}
