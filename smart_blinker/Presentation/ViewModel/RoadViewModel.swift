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
    
    // user Action
    case tappedAddCarButton
    case tappedAddHumanButton
    
    // Business Action
    case _increaseHuman
    case _decreaseHuman
    case _increaseCar
    case _decreaseCar
  }
  
  // MARK: Execute
  private func execute(_ action: Action) -> Void {
    
  }
}

private extension RoadViewModel {
  
}
