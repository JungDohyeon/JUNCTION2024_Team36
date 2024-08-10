//
//  NetworkResult.swift
//  ZANI
//
//  Created by 정도현 on 8/10/24.
//

import Foundation

public enum NetworkResult<T> {
  case success(T)
  case failure(NetworkError)
}
