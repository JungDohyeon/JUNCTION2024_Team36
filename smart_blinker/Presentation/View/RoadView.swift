//
//  RoadView.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import SwiftUI

public struct RoadView: View {
  
  @EnvironmentObject private var viewModel: RoadViewModel
  
  public var body: some View {
    ZStack {
      
    }
  }
}

#Preview {
  RoadView()
    .environmentObject(RoadViewModel())
  
}
