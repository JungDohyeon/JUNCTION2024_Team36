//
//  smart_blinkerApp.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import SwiftUI

@main
struct smart_blinkerApp: App {

  @StateObject private var viewModel: RoadViewModel = RoadViewModel()
  @StateObject private var socket: SocketProvider = SocketProvider()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(viewModel)
        .environmentObject(socket)
    }
  }
}
