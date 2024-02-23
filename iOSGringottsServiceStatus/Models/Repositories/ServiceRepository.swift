//
//  ServiceRepository.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import RxSwift

//MARK: - ServiceRepository - protocol
protocol ServiceRepository {
    func getServiceStatusObservable(service: ServiceEnum) -> Observable<ServiceStatus>
}
