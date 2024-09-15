//
//  UserRepository.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import Alamofire

protocol UserRepositoryProtocol: AnyObject {
    func getAllUsers(completion: @escaping ([User]?, Error?) -> ())
    func getUser(user: String, completion: @escaping (User?, Error?) -> ())
    func getUserRepos(user: String, completion: @escaping ([Repo]?, Error?) -> ())
}

class UserRepository: UserRepositoryProtocol {
    func getAllUsers(completion: @escaping ([User]?, Error?) -> ()) {
        AF.request(Environment.BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData { (response) in
            switch response.result {
                
            case .success:
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode ([User].self, from: data)
                    completion(result, nil)
                } catch {
                    completion([], response.error)
                }
            case .failure(_):
                completion([], response.error)
            }
        }
    }
    
    func getUser(user: String, completion: @escaping (User?, Error?) -> ()) {
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
                    completion(nil, response.error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getUserRepos(user: String, completion: @escaping ([Repo]?, Error?) -> ()) {
        AF.request(Environment.BASE_URL + "/" + user + Environment.SUFIXO, method: .get, parameters: nil, encoding: JSONEncoding.default).responseData { (response) in
            switch response.result {
                
            case .success:
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode ([Repo].self, from: data)
                    completion(result, nil)
                } catch {
                    completion([], response.error)
                }
            case .failure(_):
                completion([], response.error)
            }
        }
    }
    
    
}
