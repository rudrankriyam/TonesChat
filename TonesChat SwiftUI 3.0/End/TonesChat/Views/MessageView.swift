//
//  MessageView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import SwiftUI
import StreamChat

struct MessageView: View {
  let message: ChatMessage
  
  var body: some View {
    VStack(alignment: .leading) {
      if !message.isSentByCurrentUser {
        Text(message.author.id)
          .font(.footnote)
          .bold()
      }
      
      Text(message.text)
        .foregroundColor(isSentByCurrentUser ? .white : .primary)
        .padding()
        .background(background)
        .clipShape(ChatBubbleShape(isSentByCurrentUser: isSentByCurrentUser))
        .onLongPressGesture(perform: copyToClipboard)
    }
    .padding(isSentByCurrentUser ? .trailing : .leading)
    .frame(maxWidth: .infinity, alignment: isSentByCurrentUser ? .trailing: .leading)
  }
  
  private var background: Color {
    isSentByCurrentUser ? .brand : Color(.systemGray5)
  }
  
  private var isSentByCurrentUser: Bool {
    message.isSentByCurrentUser
  }
  
  private func copyToClipboard() {
    UIPasteboard.general.string = message.text
    
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
}
