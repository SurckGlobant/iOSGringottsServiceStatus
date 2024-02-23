//
//  ServiceViewModelProtocol.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import RxSwift

//MARK: - ServiceViewModelProtocol - protocol
protocol ServiceViewModelProtocol{
  
  func fetchServiceStatus(service: ServiceEnum) -> Observable<ServiceStatus>
  func fetchAllServiceStatus() -> Observable<ServiceStatus>
  
}
