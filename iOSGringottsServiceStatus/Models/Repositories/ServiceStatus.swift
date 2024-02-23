//
//  ServiceStatus.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

//MARK: ServiceStatus - struct
struct ServiceStatus {
    let id: ServiceEnum
    let name: String
    let route: String
    let httpCode: Int
    let lastUpdate: String
}
