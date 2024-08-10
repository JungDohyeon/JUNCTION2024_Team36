//
//  RoadViewModel.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import Foundation

final class RoadViewModel: ObservableObject {
  
  // MARK: Variables
  @Published var humanCount: Int = 0
  @Published var carCount: Int = 0
  
  private let maxHuman: Int = 10
  private let maxCar: Int = 10
  
  
  // MARK: Action
  enum Action {
    
  }
  
  // MARK: Excute
  private func excute(_ action: Action) -> Void {
    
  }
}

private extension RoadViewModel {
  
}
