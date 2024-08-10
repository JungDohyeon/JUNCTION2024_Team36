//
//  LiveBlinkersDTO.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation

public struct LiveBlinkersDTO: Codable, Hashable, Identifiable {
  public let id: Int
  public let status: Int
}

//public static Integer RED = 0;
//public static Integer REDYELLOW = 1;
//public static Integer LEFTTRUNRED = 2;
//public static Integer YELLOW = 3;
//public static Integer GREEN = 4;
