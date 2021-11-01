//
//  CarsStruct.swift
//  Request
//
//  Created by  Decagon on 31/10/2021.
//

import Foundation

// MARK: - Cars
struct Cars: Codable {
    let makeList: [MakeList]
    let pagination: Pagination
}

// MARK: - MakeList
struct MakeList: Codable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, currentPage, pageSize: Int
}
