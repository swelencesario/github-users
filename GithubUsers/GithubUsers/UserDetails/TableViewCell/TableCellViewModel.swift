//
//  UserReposCellViewModel.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 16/09/24.
//

import Foundation

class TableCellViewModel {
    var name: String?
    var repoURL: String?
    var language: String?
    
    init(repo: Repo) {
        self.name = repo.name
        self.repoURL = repo.repoURL
        self.language = repo.language
    }
}
