//
//  BaseService.swift
//  ZANI
//
//  Created by 정도현 on 8/10/24.
//

import Alamofire
import Foundation

open class BaseService<Target: BaseRouter> {
  
  typealias API = Target
  
  lazy var provider = self.AFManager
  
  private lazy var AFManager: Session = {
    var session = AF
    let apiLogger = NetworkLogger()
    let configuration = URLSessionConfiguration.af.default
    configuration.timeoutIntervalForRequest = 10
    configuration.timeoutIntervalForResource = 10
    session = Session(configuration: configuration, eventMonitors: [apiLogger])
    return session
  }()
  
  func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, type: T.Type) -> NetworkResult<T> {
    let decoder = JSONDecoder()
    
    guard let decodedData = try? decoder.decode(GeneralResponse<T>.self, from: data) else {
      return .failure(.decodingFailed)
    }
    
    switch statusCode {
    case 200..<300:
      return .success(decodedData.data)
      
    case 400..<500:
      return .failure(.requestErr)
      
    case 500:
      return .failure(.serverError)
      
    default:
      return .failure(.unknown)
    }
  }
  
  public init() {}
}

extension BaseService {
  var `default`: BaseService {
    self.provider = self.AFManager
    return self
  }
}

extension BaseService {
  func requestObjectWithNetworkError<T: Codable>(_ target: API, completion: @escaping (NetworkResult<T>) -> Void) {
    self.provider.request(target).responseData { response in
      switch response.result {
      case .success:
        guard let statusCode = response.response?.statusCode else { return }
        guard let data = response.data else { return }
        
        let networkResult = self.judgeStatus(by: statusCode, data, type: T.self)
        
        completion(networkResult)
        
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
  }
  
  func requestMultipartWithNetworkError<T: Codable>(_ target: API, completion: @escaping (NetworkResult<T>) -> Void) {
    self.provider.upload(
      multipartFormData: target.multipart,
      with: target
    ).responseData { response in
      switch response.result {
      case .success:
        guard let statusCode = response.response?.statusCode else { return }
        guard let data = response.data else { return }
        
        let networkResult = self.judgeStatus(by: statusCode, data, type: T.self)
        
        completion(networkResult)
        
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
  }
}
