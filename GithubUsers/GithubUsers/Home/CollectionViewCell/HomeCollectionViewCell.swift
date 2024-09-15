//
//  UserCell.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionCellIdentifier"
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(cellData: CollectionCellViewModel) {
        guard let image = cellData.avatarURL else { return }
        self.image.loadImageFromURL(urlString: image)
        self.nameLabel.text = cellData.name
    }
    
    func setupViews() {
        addSubview(image)
        addSubview(nameLabel)
        addSubview(profileButton)
    }
    
    func setupConstraints() {
        imageConstraints()
        nameLabelConstraints()
        profileButtonConstraints()
    }
    
    func imageConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.widthAnchor.constraint(equalToConstant: 112.0),
            image.heightAnchor.constraint(equalToConstant: 112.0),
            image.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16.0),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func profileButtonConstraints() {
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(greaterThanOrEqualTo: nameLabel.bottomAnchor),
            profileButton.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            profileButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0)
        ])
    }
}
