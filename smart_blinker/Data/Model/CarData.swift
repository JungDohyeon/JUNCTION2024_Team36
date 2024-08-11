//
//  CarData.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import UIKit
import SwiftUI

public struct CarData: Hashable {
  public let id: UUID
  public let color: String
  public var offsetX: CGFloat
  public var offsetY: CGFloat
}
