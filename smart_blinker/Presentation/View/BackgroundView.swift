//
//  BackgroundView.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import SwiftUI

public struct BackgroundView: View {
  
  @EnvironmentObject private var socket: SocketProvider
  
  public var body: some View {
    ZStack {
      Image("background")
        .resizable()
        .aspectRatio(contentMode: .fit)
  
      threeBlinkers(data: socket.blinkersStatus)
      
      twoBlinkers()
      
      oneBlinkers()
    }
  }
}

private extension BackgroundView {
  
  @ViewBuilder
  func threeBlinkers(data: [LiveBlinkersDTO]) -> some View {
    ForEach(data) { data in
      let positionData = getThreeBlinker(id: data.id)
      
      statusToBlinkerImage(status: data.status)
        .resizable()
        .frame(width: 80, height: 18)
        .rotationEffect(positionData.angle)
        .offset(x: positionData.offsetX, y: positionData.offsetY)
    }
  }
  
  @ViewBuilder
  func twoBlinkers() -> some View {
    Image("twoColorRed")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: -500, y: -106)
    
    Image("twoColorBlocked")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: -500, y: 50)
    
    Image("twoColorRed")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: -220, y: -106)
    
    Image("twoColorBlocked")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: -220, y: 50)
    
    Image("twoColorRed")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: -20, y: -106)
    
    Image("twoColorBlocked")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: -20, y: 50)
    
    Image("twoColorRed")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: 270, y: -106)
    
    Image("twoColorBlocked")
      .resizable()
      .frame(width: 24, height: 56)
      .offset(x: 270, y: 50)
  }
  
  @ViewBuilder
  func oneBlinkers() -> some View {
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(0))
      .frame(width: 13, height: 24)
      .offset(x: -435, y: 120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(180))
      .frame(width: 13, height: 24)
      .offset(x: -286, y: 120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(0))
      .frame(width: 13, height: 24)
      .offset(x: -435, y: -120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(180))
      .frame(width: 13, height: 24)
      .offset(x: -286, y: -120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(0))
      .frame(width: 13, height: 24)
      .offset(x: 52, y: 120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(180))
      .frame(width: 13, height: 24)
      .offset(x: 200, y: 120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(0))
      .frame(width: 13, height: 24)
      .offset(x: 52, y: -120)
    
    Image("oneColorRed")
      .resizable()
      .rotationEffect(.degrees(180))
      .frame(width: 13, height: 24)
      .offset(x: 200, y: -120)
  }
}

#Preview {
  BackgroundView()
}
