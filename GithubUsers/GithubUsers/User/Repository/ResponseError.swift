//
//  Error.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 14/09/24.
//

import Foundation

enum ResponseError: Error {
    case notFound
    case decodingError
    case genericError
}
