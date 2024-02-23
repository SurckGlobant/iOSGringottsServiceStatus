//
//  ServiceStatusFactory.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import UIKit

public final class ServiceStatusFactory{
  
  func serviceViewController() -> UIViewController{
    let sessionManager:NetworkSessionManager = URLSessionManager()
    let viewModel:ServiceViewModelProtocol = ServiceViewModel(sessionManager: sessionManager)
    let vc: UIViewController = ServiceStatusViewController(viewModel: viewModel)
    return vc
  }
}
