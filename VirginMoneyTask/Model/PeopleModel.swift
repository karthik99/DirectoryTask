//
//  PeopleModel.swift
//  VirginMoneyTask
//
//  Created by Karthik on 22/04/21.
//  Copyright © 2021 Karthik. All rights reserved.
//

import Foundation

struct Directory: Codable {
    var avatar: String?
    var phone: String?
    var firstName: String?
    var id: String?
    var favouriteColor: String?
    var email: String?
    var jobTitle: String?
    var createdAt: String?
    var lastName: String?
    
    
   private enum CodingKeys: String, CodingKey {
        case avatar
        case phone
        case firstName
         case id
         case favouriteColor
         case email
         case jobTitle
         case createdAt
         case lastName
        
         
    }
}

struct Rooms: Codable {
    
    var id: String?
    var createdAt: String?
    var name: String?
    var maxOccupancy: Int?
    var isOccupied: Bool?
    
    
    private enum CodingKeys: String, CodingKey {
        
        case id
        case createdAt = "created_at"
        case name
        case maxOccupancy = "max_occupancy"
        case isOccupied = "is_occupied"
    }
}




