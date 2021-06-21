//
//  TonesChatApp.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 26/05/21.
//

import SwiftUI
import StreamChat

@main
struct TonesChatApp: App {
  init() {
    setupStream()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

extension TonesChatApp {
  private func setupStream() {
    let config = ChatClientConfig(apiKeyString: "API KEY")
    
    ChatClient.shared = ChatClient(config: config, tokenProvider: .anonymous)
  }
}

extension ChatClient {
  static var shared: ChatClient!
}
