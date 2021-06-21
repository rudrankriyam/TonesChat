//
//  ChatView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 27/05/21.
//

import SwiftUI
import StreamChat

struct ChatView: View {
  @StateObject private var channel = ChatClient.shared.channelController(
    for: ChannelId(type: .messaging, id: "paradise"))
    .observableObject
  
  @State private var text: String = ""
  
  var body: some View {
    VStack {
      ScrollView(showsIndicators: false) {
        LazyVStack {
          ForEach(channel.messages, id: \.self) { message in
            MessageView(message: message)
              .scaleEffect(x: 1, y: -1, anchor: .center)
          }
        }
      }
      .scaleEffect(x: 1, y: -1, anchor: .center)
      
      HStack {
        TextField("Type a message", text: $text)
        
        Button(action: sendMessage) {
          Image(systemName: "paperplane.circle.fill")
            .accessibility(label: Text("Send"))
            .font(.system(size: 30))
        }
      }
      .padding()
    }
    .padding(.top, 1)
    .navigationBarTitle("Music Paradise", displayMode: .inline)
    .onAppear {
      channel.controller.synchronize()
    }
  }
  
  private func sendMessage() {
    if !text.isEmpty {
      channel.controller.createNewMessage(text: text) { result in
        switch result {
        case .success(let response):
          print(response)
        case .failure(let error):
          print(error)
        }
      }
      text = ""
    }
  }
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
