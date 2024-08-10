//
//  BlinkersService.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import Alamofire

typealias DefaultBlinkersService = BaseService<BlinkersRouter>

public protocol BlinkersService {

  func requestInit(
    completion: @escaping (NetworkResult<[LiveBlinkersDTO]>) -> Void
  )
}

extension DefaultBlinkersService: BlinkersService {
  public func requestInit(completion: @escaping (NetworkResult<[LiveBlinkersDTO]>) -> Void) {
    return requestObjectWithNetworkError(.requestInit, completion: completion)
  }
}
