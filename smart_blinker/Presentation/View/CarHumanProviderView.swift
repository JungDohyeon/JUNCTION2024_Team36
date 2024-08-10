//
//  CarHumanProviderView.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import SwiftUI

public struct CarHumanProviderView: View {
  @EnvironmentObject private var viewModel: RoadViewModel
  
  public var body: some View {
    VStack(spacing: 0) {
      HStack {
        Spacer()
        
        Text("Human: \(viewModel.humanCount), Cars: \(viewModel.carCount)")
      }
      
      Spacer()
    }
  }
}

#Preview {
  CarHumanProviderView()
}
