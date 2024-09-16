//
//  HomeViewModel.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import Foundation

class HomeViewModel {
    let repository: UserRepositoryProtocol
    var cellViewModel = Observable<[CollectionCellViewModel]?>(nil)
    var showError: (() -> Void)?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func listAllUsers() {
        repository.getAllUsers { users, userError in
            guard let users = users else { return }
            
            if userError != nil {
                self.showError?()
            }
            self.cellViewModel.value = users.map {CollectionCellViewModel(user: $0)}
        }
    }
}
