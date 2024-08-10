//
//  ThreeColorBlinker.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import SwiftUI

public enum ThreeColorBlinkerPosition {
  case id1, id2, id3, id4, id5, id6, id7, id8, id9, id10
  
  public var angle: Angle {
    switch self {
      
    case .id1:
      return Angle.degrees(90)
    case .id2:
      return Angle.degrees(-90)
    case .id3:
      return Angle.degrees(0)
    case .id4:
      return Angle.degrees(180)
    case .id5:
      return Angle.degrees(90)
    case .id6:
      return Angle.degrees(-90)
    case .id7:
      return Angle.degrees(0)
    case .id8:
      return Angle.degrees(180)
    case .id9:
      return Angle.degrees(90)
    case .id10:
      return Angle.degrees(-90)
    }
  }
  
  public var offsetX: CGFloat {
    switch self {
    case .id1:
      return -445
    case .id2:
      return -274
    case .id3:
      return -320
    case .id4:
      return -400
    case .id5:
      return 44
    case .id6:
      return 214
    case .id7:
      return 166
    case .id8:
      return 86
    case .id9:
      return 530
    case .id10:
      return 460
    }
  }
  
  public var offsetY: CGFloat {
    switch self {
    case .id1, .id5, .id9:
      return 40
    case .id2, .id6, .id10:
      return -40
    case .id3, .id7:
      return 84
    case .id4, .id8:
      return -84
    }
  }
}

public func getThreeBlinker(id: Int) -> ThreeColorBlinkerPosition {
  switch id {
  case 1:
    return .id1
  case 2:
    return .id2
  case 3:
    return .id3
  case 4:
    return .id4
  case 5:
    return .id5
  case 6:
    return .id6
  case 7:
    return .id7
  case 8:
    return .id8
  case 9:
    return .id9
  case 10:
    return .id10
  default:
    return .id1
  }
}

public func statusToBlinkerImage(status: Int) -> Image {
  switch status {
  case 0:
    return Image("threeColorRed")
  case 1:
    return Image("threeColorYellow")
  case 2:
    return Image("threeColorLeft")
  case 3:
    return Image("threeColorYellow")
  case 4:
    return Image("threeColorGreen")
  default:
    return Image("threeColorRed")
  }
}
