//
//  BackgroundView.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import SwiftUI

public struct BackgroundView: View {
  public var body: some View {
    ZStack {
      Image("background")
        .resizable()
        .aspectRatio(contentMode: .fit)
  
      threeBlinkers()
      
      twoBlinkers()
      
      oneBlinkers()
    }
  }
}

private extension BackgroundView {
  
  @ViewBuilder
  func threeBlinkers() -> some View {
    
    // 1
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(90))
      .frame(width: 80, height: 18)
      .offset(x: -445, y: 40)
    
    // 2
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(-90))
      .frame(width: 80, height: 18)
      .offset(x: -274, y: -40)
    
    // 3
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(0))
      .frame(width: 80, height: 18)
      .offset(x: -320, y: 84)
    
    // 4
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(180))
      .frame(width: 80, height: 18)
      .offset(x: -400, y: -84)
   
    // 5
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(90))
      .frame(width: 80, height: 18)
      .offset(x: 44, y: 40)
    
    // 6
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(-90))
      .frame(width: 80, height: 18)
      .offset(x: 214, y: -40)
    
    // 7
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(0))
      .frame(width: 80, height: 18)
      .offset(x: 166, y: 84)
    
    // 8
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(180))
      .frame(width: 80, height: 18)
      .offset(x: 86, y: -84)
    
    // 9
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(90))
      .frame(width: 80, height: 18)
      .offset(x: 530, y: 40)
    
    // 10
    Image("threeColorRed")
      .resizable()
      .rotationEffect(.degrees(-90))
      .frame(width: 80, height: 18)
      .offset(x: 460, y: -40)
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
