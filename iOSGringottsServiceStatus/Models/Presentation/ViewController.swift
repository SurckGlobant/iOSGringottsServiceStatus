//
//  ViewController.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//

import UIKit
import RxSwift

final class ServiceStatusViewController: UIViewController {
  
  var viewModel: ServiceViewModelProtocol
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .gray
    fetchServiceStatus()
    fetchAllServiceStatus()
  }
  
  init(viewModel: ServiceViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func fetchServiceStatus() {
    let service = ServiceEnum.Characters
    
    viewModel.fetchServiceStatus(service: service)
      .subscribe(onNext: { [weak self] status in
        print("Status: \(status.httpCode)")
      }, onError: { [weak self] error in
        print("Error: \(error.localizedDescription)")
      })
      .disposed(by: disposeBag)
    
    
  }
  
  func fetchAllServiceStatus() {
    viewModel.fetchAllServiceStatus()
      .subscribe(onNext: { [weak self] status in
        // Aquí manejas los estados de los servicios uno por uno
        print("Status: \(status)")
      }, onError: { [weak self] error in
        // Manejar cualquier error que ocurra durante la solicitud
        print("Error: \(error)")
      }, onCompleted: {
        // Aquí manejas la notificación de que todos los servicios han terminado
        print("Todos los servicios han terminado.")
      })
      .disposed(by: disposeBag)
  }
}
