//
//  MyCollectionViewCell.swift
//  lesson24_restAPI
//
//  Created by Даниил Евгеньевич on 16.07.2024.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var id = UILabel()
    var firstName = UILabel()
    var lastName = UILabel()
    var email = UILabel()
    
    var stackView = UIStackView(frame: .zero)
    
    func configure(id: String, firstName: String, lastName: String, email: String) {
        
        
        
        
        self.id.text = id
        self.firstName.text = firstName
        self.lastName.text = lastName
        self.email.text = email
        
        self.id.translatesAutoresizingMaskIntoConstraints = false
        self.firstName.translatesAutoresizingMaskIntoConstraints = false
        self.lastName.translatesAutoresizingMaskIntoConstraints = false
        self.email.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(self.id)
        addSubview(self.firstName)
        addSubview(self.lastName)
        addSubview(self.email)
        
        NSLayoutConstraint.activate([
            self.id.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            self.id.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            self.firstName.topAnchor.constraint(equalTo: self.id.bottomAnchor, constant: 10),
            self.firstName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            self.lastName.topAnchor.constraint(equalTo: self.firstName.bottomAnchor, constant: 10),
            self.lastName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            self.email.topAnchor.constraint(equalTo: self.lastName.bottomAnchor, constant: 10),
            self.email.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            
        ])
        
    }
    
}
