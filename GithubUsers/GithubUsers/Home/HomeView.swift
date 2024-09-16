//
//  HomeView.swift
//  GithubUsers
//
//  Created by Swelen Ebert on 13/09/24.
//

import UIKit

class HomeView: UIView {
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16.0
        layout.minimumInteritemSpacing = 8.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
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
        addSubview(collection)
    }
    
    func setupConstraints() {
        collectionConstraints()
    }
    
    func collectionConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor, constant: 40.0),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -104.0),
        ])
    }
}
