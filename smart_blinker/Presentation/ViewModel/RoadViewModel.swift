//
//  RoadViewModel.swift
//  smart_blinker
//
//  Created by 정도현 on 8/10/24.
//

import Foundation
import Combine
import UIKit

final class RoadViewModel: ObservableObject {
  
  // MARK: Variables
  @Published var humanCount: Int = 0
  @Published var carCount: Int = 0
  
  @Published var cars: [CarData] = []
  @Published var reverseCars: [CarData] = []
  
  private let maxHuman: Int = 10
  private let maxCar: Int = 10
  
  private let reverseline1Y: CGFloat = -60
  private let reverseline2Y: CGFloat = -20
  private let line1Y: CGFloat = 20
  private let line2Y: CGFloat = 60
  
  private var timer: AnyCancellable?
  
  private var carPosition = 1
  
  // MARK: Action
  enum Action {
    
    // user Action
    case tappedAddCarButton
    case tappedAddHumanButton
    case startTimer
    
    // Business Action
    case _increaseHuman
    case _decreaseHuman
    case _increaseCar
    case _decreaseCar
  }
  
  // MARK: Execute
  public func action(_ action: Action) -> Void {
    switch action {
    case .tappedAddCarButton:
      self.action(._increaseCar)
      
    case .tappedAddHumanButton:
      self.stop()
      self.action(._increaseHuman)
      
    case .startTimer:
      self.startTimer()
      
    case ._increaseCar:
      if self.carCount < 10 {
        addCars()
      }
      
    case ._increaseHuman:
      if self.humanCount < 10 {
        self.humanCount += 1
      }
      
    case ._decreaseHuman:
      if self.humanCount > 0 {
        self.humanCount -= 1
      }
      
    case ._decreaseCar:
      if self.carCount > 10 {
        self.humanCount -= 1
      }
    }
  }
}

private extension RoadViewModel {
  private func startTimer() {
    timer = Timer.publish(every: 0.016, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        self?.moveCars()
        self?.moveReverseCars()
      }
  }
  
  private func addCars() {
    self.carCount += 1
    
    switch carPosition {
    case 1:
      self.cars.append(CarData(id: UUID(), color: "blueCar", offsetX: CGFloat(-UIScreen.main.bounds.height / 2 - 200), offsetY: line1Y))
      carPosition += 1
    case 2:
      self.reverseCars.append(CarData(id: UUID(), color: "greenCar", offsetX: CGFloat(UIScreen.main.bounds.height / 2 + 200), offsetY: reverseline1Y))
      carPosition += 1
    case 3:
      self.cars.append(CarData(id: UUID(), color: "blackCar", offsetX: CGFloat(-UIScreen.main.bounds.height / 2 - 200), offsetY: line2Y))
      carPosition += 1
    case 4:
      self.reverseCars.append(CarData(id: UUID(), color: "yellowCar", offsetX: CGFloat(UIScreen.main.bounds.height / 2 + 200), offsetY: reverseline2Y))
      carPosition = 1
      
    default:
      self.cars.append(CarData(id: UUID(), color: "cyanCar", offsetX: CGFloat(-UIScreen.main.bounds.height / 2 - 200), offsetY: line1Y))
      carPosition += 1
    }
  }
  
  private func moveCars() {
    for index in cars.indices {
      print(SocketProvider.shared.blinkersStatus[0].status)
      
      if (
        cars[index].offsetX > -550 &&
        cars[index].offsetX <= -459 &&
        SocketProvider.shared.blinkersStatus[0].status == 0
      ) {
        self.stop()
      }
      
      if (
        cars[index].offsetX <= 20 && 
        cars[index].offsetX >= -20 &&
        SocketProvider.shared.blinkersStatus[5].status == 0
      ) {
        self.stop()
      }
      
      cars[index].offsetX += 2
      
      if cars[index].offsetX > UIScreen.main.bounds.width + 200 {
        /// self.carCount -= 1
      }
    }
  }

  private func moveReverseCars() {
    for index in reverseCars.indices {
      reverseCars[index].offsetX -= 2
      
      if reverseCars[index].offsetX < -UIScreen.main.bounds.width - 200 {
        /// self.carCount -= 1
      }
    }
  }
  
  private func stop() {
    timer = Timer.publish(every: 0.016, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        self?.check()
      }
  }
  
  private func check() {
    if (
      SocketProvider.shared.blinkersStatus[0].status == 4
    ) {
      self.resume()
    } else if (
      SocketProvider.shared.blinkersStatus[5].status == 4
    ) {
      self.resume()
    }
  }
  
  private func resume() {
    startTimer()
  }
}
