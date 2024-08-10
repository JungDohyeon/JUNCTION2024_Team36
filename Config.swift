//
//  Config.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import Foundation

enum Config {
  enum Keys {
    enum Plist {
      static let baseURL = "BASE_URL"
      static let kakakoAppKey = "KAKAO_NATIVE_APP_KEY"
    }
  }
  
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("plist cannot found.")
    }
    return dict
  }()
}

extension Config {
  static let baseURL: String = {
    guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
      fatalError("Base URL is not set in plist for this configuration.")
    }
    return key
  }()
  
  static let kakakoAppKey: String = {
    guard let key = Config.infoDictionary[Keys.Plist.kakakoAppKey] as? String else {
      fatalError("Kakao SDK KEy is not set in plist for this configuration.")
    }
    return key
  }()
}
