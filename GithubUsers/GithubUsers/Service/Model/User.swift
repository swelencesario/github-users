//
//  User.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import Foundation

struct User: Codable {
    let login: String?
    let avatarURL: String?
    let htmlURL: String?
    let repos: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case repos = "repos_url"
    }
}

struct Repo: Codable {
    let name: String?
    let repoURL: String?
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case repoURL = "html_url"
        case language
    }
}
