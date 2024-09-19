//
//  UserDetailsViewModel.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import Foundation

class UserDetailsViewModel {
    let repository: UserRepositoryProtocol
    var user = Observable<User?>(nil)
    var cellViewModel = Observable<[TableCellViewModel]?>(nil)
    var showError: (() -> Void)?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func findUser(user: String) {
        repository.getUser(user: user) { user, responseError in
            guard let users = user else { return }
            
            if responseError != nil {
                self.showError?()
            }
            self.user.value = user
        }
    }
    
    func listUserRepos(user: String) {
        repository.getUserRepos(user: user) { repos, responseError in
            guard let repos = repos else { return }
            
            if responseError != nil {
                self.showError?()
            }
            self.cellViewModel.value = repos.map { TableCellViewModel(repo: $0)
            }
        }
    }
}
