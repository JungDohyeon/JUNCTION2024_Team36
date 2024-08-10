//
//  BlinkersRepository.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation

protocol BlinkersRepository {
  
  /// 소셜 로그인
  func requestInit(
    completion: @escaping (NetworkResult<[LiveBlinkersDTO]>) -> Void
  )
}
