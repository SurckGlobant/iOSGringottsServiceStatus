//
//  ServiceViewModel.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import RxSwift

final class ServiceViewModel: ServiceViewModelProtocol{
  private let sessionManager: NetworkSessionManager
  
  init(sessionManager: NetworkSessionManager) {
    self.sessionManager = sessionManager
  }
  
  func fetchAllServiceStatus() -> Observable<ServiceStatus> {
    let services: [ServiceEnum] = [.Characters, .CharactersByID, .Students, .Staff, .Spells, .CharactersInHouse]
    
    let observables = services.map { service in
      sessionManager.request(service: service)
    }
    
    return Observable.merge(observables)
  }
}

