//
//  DefaultBlinkersRepository.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import Alamofire

public class DefaultBlinkersRepository: BlinkersRepository {
  private let service: BlinkersService
  
  public init(service: BlinkersService) {
    self.service = service
  }
}

extension DefaultBlinkersRepository {

  public func requestInit(
    completion: @escaping (NetworkResult<[LiveBlinkersDTO]>) -> (Void)
  ) {
    service.requestInit(completion: completion)
  }
}
