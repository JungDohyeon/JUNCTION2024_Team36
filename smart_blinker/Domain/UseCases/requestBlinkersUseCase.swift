//
//  requestBlinkersUseCase.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import UIKit

protocol requestBlinkersUseCase {
  func requestInit(
    completion: @escaping (NetworkResult<[LiveBlinkersDTO]>) -> (Void)
  )
}

final class requestBlinkersUseCaseImpl: requestBlinkersUseCase {
  
  private let repository: BlinkersRepository
  
  init() {
    self.repository = DefaultBlinkersRepository(service: DefaultBlinkersService())
  }
  
  func requestInit(completion: @escaping (NetworkResult<[LiveBlinkersDTO]>) -> (Void)) {
    repository.requestInit(completion: completion)
  }
}
  
