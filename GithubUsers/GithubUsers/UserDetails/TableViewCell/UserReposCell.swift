//
//  UserReposCell.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 16/09/24.
//

import Foundation
import UIKit

class UserReposCell: UITableViewCell {
    static let identifier = "UserReposCellIdentifier"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Hiragino Sans W5", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Hiragino Sans W3", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var linkToRepoButton: UIButton = {
        let button = UIButton()
            button.setTitle("Go to repo", for: .normal)
            button.titleLabel?.font = UIFont(name: "Hiragino Sans W3", size: 12.0)
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(repo: TableCellViewModel) {
        nameLabel.text = repo.name
        languageLabel.text = repo.language
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(languageLabel)
        addSubview(linkToRepoButton)
    }
    
    func setupConstraints() {
        nameLabelConstraints()
        languageLabelConstraints()
        linkToRepoButtonConstraints()
    }
    
    func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -8.0)
        ])
    }
    
    func languageLabelConstraints() {
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8.0),
            languageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)
        ])
    }
    
    func linkToRepoButtonConstraints() {
        NSLayoutConstraint.activate([
            linkToRepoButton.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 8.0),
            linkToRepoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            linkToRepoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
            linkToRepoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0)
        ])
    }
}
