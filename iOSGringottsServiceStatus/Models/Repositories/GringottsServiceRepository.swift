//
//  GringottsServiceRepository.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import Foundation
import RxSwift

class GringottsServiceRepository: ServiceRepository {
  
  private let sessionManager: NetworkSessionManager
  
  init(sessionManager: NetworkSessionManager = URLSessionManager()) {
    self.sessionManager = sessionManager
  }
  
  func getServiceStatusObservable(service: ServiceEnum) -> Observable<ServiceStatus> {
    return sessionManager.request(service: service)
  }
}
