//
//  NetworkSessionManager.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import RxSwift

//MARK: - NetworkSessionManager - protocol

protocol NetworkSessionManager {
    func request(service: ServiceEnum) -> Observable<ServiceStatus>
}
