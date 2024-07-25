//
//  Person.swift
//  lesson24_restAPI
//
//  Created by Даниил Евгеньевич on 12.07.2024.
//

import Foundation

struct Person: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
}
