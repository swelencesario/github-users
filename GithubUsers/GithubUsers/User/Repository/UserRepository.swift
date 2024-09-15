//
//  UserRepository.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import Alamofire

protocol UserRepositoryProtocol: AnyObject {
    func getAllUsers(completion: @escaping ([User]?, ResponseError?) -> ())
    func getUser(user: String, completion: @escaping (User?, ResponseError?) -> ())
    func getUserRepos(user: String, completion: @escaping ([Repo]?, ResponseError?) -> ())
}

class UserRepository: UserRepositoryProtocol {
    func getAllUsers(completion: @escaping ([User]?, ResponseError?) -> ()) {
        AF.request(Environment.BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData { (response) in
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode != 200 {
                let error = ResponseError.notFound
                completion([], error)
                return
            }
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode ([User].self, from: data)
                    completion(result, nil)
                } catch {
                    completion([], ResponseError.decodingError)
                }
            case .failure(_):
                completion([], ResponseError.genericError)
            }
        }
    }
    
    func getUser(user: String, completion: @escaping (User?, ResponseError?) -> ()) {
        AF.request(Environment.BASE_URL + "/" + user, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData { (response) in
            guard let statusCode = response.response?.statusCode else { return }
            if statusCode == 404 {
                let error = ResponseError.notFound
                completion(nil, error)
                return
            }
            
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode (User.self, from: data)
                    completion(result, nil)
                } catch {
                    completion(nil, ResponseError.decodingError)
                }
            case .failure:
                completion(nil, ResponseError.genericError)
            }
        }
    }
    
    func getUserRepos(user: String, completion: @escaping ([Repo]?, ResponseError?) -> ()) {
        AF.request(Environment.BASE_URL + "/" + user + Environment.SUFIXO, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData { (response) in
            switch response.result {
                
            case .success:
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode ([Repo].self, from: data)
                    completion(result, nil)
                } catch {
                    completion([], ResponseError.decodingError)
                }
            case .failure:
                completion([], ResponseError.genericError)
            }
        }
    }
}
