//
//  NetworkError.swift
//  ZANI
//
//  Created by 정도현 on 8/10/24.
//

import Foundation

public enum NetworkError: Error {
  case invalidResponse
  case invalidData
  case requestFailed(error: Error)
  case decodingFailed
  case requestErr
  case serverError
  case unknown
}
