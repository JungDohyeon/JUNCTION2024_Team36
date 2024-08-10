//
//  BlinkersRouter.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import Alamofire
import SwiftUI

enum BlinkersRouter {
  case requestInit
}

extension BlinkersRouter: BaseRouter {
  
  var path: String {
    switch self {
    case .requestInit:
      return "/blinkers"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .requestInit:
      return .get
    }
  }
  
  var parameters: RequestParams {
    switch self {
    case .requestInit:
      return .requestPlain
    }
  }
  
  var header: HeaderType {
    switch self {
    case .requestInit:
      return .plain
    }
  }
}
