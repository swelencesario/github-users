//
//  UserRepositoryMock.swift
//  GithubUsersTests
//
//  Created by Swelen Ebert on 16/09/24.
//

import Foundation
@testable import GithubUsers

class UserRepositoryMock: UserRepositoryProtocol {
    
    var users = [User(login: "swelencesario", avatarURL: "https://avatars.githubusercontent.com/u/65640306?v=4", htmlURL: "https://github.com/swelencesario")]
    
    var userByLogin = User(login: "swelencesario", avatarURL: "https://avatars.githubusercontent.com/u/65640306?v=4", htmlURL: "https://github.com/swelencesario")
    
    var error: ResponseError?
    
    func getAllUsers(completion: @escaping ([GithubUsers.User]?, GithubUsers.ResponseError?) -> ()) {
        completion(users, error)
    }
    
    func getUser(user: String, completion: @escaping (GithubUsers.User?, GithubUsers.ResponseError?) -> ()) {
        completion(userByLogin, error)
    }
    
    func getUserRepos(user: String, completion: @escaping ([GithubUsers.Repo]?, GithubUsers.ResponseError?) -> ()) {
        
    }
    
    
}
