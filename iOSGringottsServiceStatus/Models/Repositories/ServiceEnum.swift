//
//  ServiceEnum.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

//MARK: - ServiceEnum - Enum
enum ServiceEnum {
  case Characters
  case CharactersByID
  case Students
  case Staff
  case Spells
  case CharactersInHouse
  
  func getURL() -> (String) {
    switch self {
    case .Characters:
      return ServiceStatusConstants.Urls.characters
    case .CharactersByID:
      return ServiceStatusConstants.Urls.charactersByID
    case .Students:
      return ServiceStatusConstants.Urls.students
    case .Staff:
      return ServiceStatusConstants.Urls.staff
    case .Spells:
      return ServiceStatusConstants.Urls.spells
    case .CharactersInHouse:
      return ServiceStatusConstants.Urls.charactersInHouse
    }
  }
  
  func getName() -> (String) {
    switch self {
    case .Characters:
      return ServiceStatusConstants.Names.characters
    case .CharactersByID:
      return ServiceStatusConstants.Names.charactersByID
    case .Students:
      return ServiceStatusConstants.Names.students
    case .Staff:
      return ServiceStatusConstants.Names.staff
    case .Spells:
      return ServiceStatusConstants.Names.spells
    case .CharactersInHouse:
      return ServiceStatusConstants.Names.charactersInHouse
    }
  }
}
