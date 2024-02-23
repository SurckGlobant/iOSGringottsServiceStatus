//
//  URLSessionManager.swift
//  iOSGringottsServiceStatus
//
//  Created by David Bautista on 23/02/24.
//

import RxSwift

//MARK: - URLSessionManager - class
class URLSessionManager: NetworkSessionManager {
  func request(service: ServiceEnum) -> Observable<ServiceStatus> {
    guard let url:URL = URL(string: service.getURL()) else {
      return Observable.error(NetworkError.invalidURL)
    }
    
    let request:URLRequest = URLRequest(url: url)
    
    return Observable.create { observer in
      let task:URLSessionDataTask = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
          observer.onError(error)
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
          observer.onError(NetworkError.unknown)
          return
        }
        
        let httpCode:Int = httpResponse.statusCode
        let serviceStatus:ServiceStatus = ServiceStatus(id: service,
                                                        name: service.getName(),
                                                        route: service.getURL(),
                                                        httpCode: httpCode,
                                                        lastUpdate: "")
        observer.onNext(serviceStatus)
        observer.onCompleted()
      }
      
      task.resume()
      
      return Disposables.create {
        task.cancel()
      }
    }
  }
}
