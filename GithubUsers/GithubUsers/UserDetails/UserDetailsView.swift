//
//  UserDetailsView.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import UIKit

class UserDetailsView: UIView {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 8.0
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Hiragino Sans W5", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
            button.setTitle("Profile", for: .normal)
            button.titleLabel?.font = UIFont(name: "Hiragino Sans W3", size: 12.0)
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        
        table.register(UserReposCell.self, forCellReuseIdentifier: UserReposCell.identifier)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(image)
        addSubview(nameLabel)
        addSubview(profileButton)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        imageConstraints()
        nameLabelConstraints()
        profileButtonConstraints()
        tableViewConstraints()
    }
    
    func imageConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 112.0),
            image.widthAnchor.constraint(equalToConstant: 112.0),
            image.heightAnchor.constraint(equalToConstant: 112.0),
            image.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16.0),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }
    
    func profileButtonConstraints() {
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            profileButton.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }
    
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 16.0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0)
        ])
    }
}
