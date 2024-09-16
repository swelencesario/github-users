//
//  CollectionCellData.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 15/09/24.
//

import Foundation

class CollectionCellViewModel {
    var avatarURL: String?
    var name: String?
    var profileURL: String?
    
    init(user: User) {
        self.avatarURL = user.avatarURL
        self.name = user.login
        self.profileURL = user.htmlURL
    }
}
