
import SwiftUI

public struct RoadView: View {
  
  @EnvironmentObject private var viewModel: RoadViewModel
  
  // 확대/축소 및 이동을 위한 상태 변수
  @State private var scale: CGFloat = 1.0
  @State private var offset: CGSize = .zero
  @State private var lastDragPosition: CGSize = .zero
  
  public var body: some View {
    GeometryReader { geometry in
      let imageWidth = geometry.size.width * scale
      let screenWidth = geometry.size.width
      
      // 이미지가 화면보다 큰 경우에만 이동을 허용하기 위한 범위 계산
      let maxOffsetX = max(0, (imageWidth - screenWidth) / 2)
      
      BackgroundView()
        .scaleEffect(scale)
        .offset(x: offset.width, y: 0)
        .gesture(
          DragGesture()
            .onChanged { value in
              var newOffsetX = lastDragPosition.width + value.translation.width
              
              // 좌우 이동 범위 제한
              newOffsetX = min(max(newOffsetX, -maxOffsetX), maxOffsetX)
              offset = CGSize(width: newOffsetX, height: 0)
            }
            .onEnded { _ in
              lastDragPosition = offset
            }
        )
        .gesture(
          MagnificationGesture()
            .onChanged { value in
              scale = value
              
              // 확대 시 이미지가 화면보다 커질 때 오프셋 제한 재계산
              let newMaxOffsetX = max(0, (imageWidth - screenWidth) / 2)
              offset.width = min(max(offset.width, -newMaxOffsetX), newMaxOffsetX)
            }
            .onEnded { _ in
              lastDragPosition = offset
            }
        )
        .frame(width: screenWidth, height: geometry.size.height)
    }
    .edgesIgnoringSafeArea(.all)
  }
}
