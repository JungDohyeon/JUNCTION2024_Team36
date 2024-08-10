//
//  ContentView.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import SwiftUI

public struct ContentView: View {
  
  @EnvironmentObject private var viewModel: RoadViewModel
  
  public var body: some View {
    ZStack {
      RoadView()
      
      CarHumanProviderView()
    }
  }
}

#Preview {
  ContentView()
}
