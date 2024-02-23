//
//  ServiceStatusConstants.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

//MARK: - ServiceEnum - Enum
struct ServiceStatusConstants{
  struct Urls {
    static let characters:String = "https://hp-api.onrender.com/api/characters"
    static let charactersByID:String = "https://hp-api.onrender.com/api/character/:id"
    static let students:String = "https://hp-api.onrender.com/api/characters/students"
    static let staff:String = "https://hp-api.onrender.com/api/characters/staff"
    static let spells:String = "https://hp-api.onrender.com/api/characters/house/gryffindor"
    static let charactersInHouse:String = "https://hp-api.onrender.com/api/spells"
  }
  
  struct Names {
    static let characters:String = "All Characters"
    static let charactersByID:String = "Specific Character by ID"
    static let students:String = "Hogwarts Students"
    static let staff:String = "Hogwarts Staff"
    static let spells:String = "Characters in a House"
    static let charactersInHouse:String = "All Spells"
  }
}
