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
      Text("Human : \(viewModel.humanCount), Cars : \(viewModel.carCount)")
        .font(.system(size: 16, weight: .bold))
        .padding(.vertical, 10)
        .padding(.horizontal, 40)
        .background(
          Capsule()
            .fill(.white.opacity(0.3))
            .overlay(
              Capsule()
                .stroke(.white.opacity(0.7))
            )
        )
      
      Spacer()
    }
    .padding(32)
  }
}

#Preview {
  CarHumanProviderView()
}
