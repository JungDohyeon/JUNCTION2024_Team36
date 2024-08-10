//
//  SocketProvider.swift
//  smart_blinker
//
//  Created by 정도현 on 8/11/24.
//

import Foundation
import Combine
import Starscream

final class SocketProvider: ObservableObject {
  @Published var blinkersStatus: [LiveBlinkersDTO] = [
    .init(id: 1, status: 0),
    .init(id: 2, status: 0),
    .init(id: 3, status: 0),
    .init(id: 4, status: 0),
    .init(id: 5, status: 0),
    .init(id: 6, status: 0),
    .init(id: 7, status: 0),
    .init(id: 8, status: 0),
    .init(id: 9, status: 0),
    .init(id: 10, status: 0)
  ]
  
  private var socket: WebSocket!
  
  init() {
    let serverURL = URL(string: "wss://zolang.site/ws-connection")!
    var request = URLRequest(url: serverURL)
    request.timeoutInterval = 5
    socket = WebSocket(request: request)
    socket.delegate = self
    socket.connect()
  }
}

// MARK: STOMP
extension SocketProvider: WebSocketDelegate {
  func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
    switch event {
    case .connected(_):
      print("WebSocket is connected")
      connectStomp()
      
    case .text(let string):
      if string.contains("CONNECTED") {
        print("STOMP Connected")
        subscribe(to: "/subscribe/blinkers")
      } else {
        print(string)
        
        let idPattern = "\"id\":(\\d+)"
        let statusPattern = "\"status\":(\\d+)"
        
        let idRegex = try! NSRegularExpression(pattern: idPattern, options: [])
        let statusRegex = try! NSRegularExpression(pattern: statusPattern, options: [])
        
        let idRange = NSRange(location: 0, length: string.utf16.count)
        let statusRange = NSRange(location: 0, length: string.utf16.count)
        
        let idMatches = idRegex.matches(in: string, options: [], range: idRange)
        let statusMatches = statusRegex.matches(in: string, options: [], range: statusRange)
        
        let id = idMatches.first.flatMap {
            Int((string as NSString).substring(with: $0.range(at: 1)))
        }
        
        let status = statusMatches.first.flatMap {
            Int((string as NSString).substring(with: $0.range(at: 1)))
        }
        
        if let id = id, let status = status {
          self.blinkersStatus[id - 1] = .init(id: id, status: status)
        }
      }
      
    default:
      break
    }
  }
  
  func connectStomp() {
    let connectFrame = "CONNECT\naccept-version:1.1,1.0\n\n\u{00}"
    socket.write(string: connectFrame)
  }
  
  func subscribe(to destination: String) {
    let subscribeFrame = "SUBSCRIBE\nid:sub-0\ndestination:\(destination)\n\n\u{00}"
    socket.write(string: subscribeFrame)
  }
}
