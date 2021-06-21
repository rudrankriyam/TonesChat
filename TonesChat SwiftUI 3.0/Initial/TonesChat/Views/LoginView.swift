//
//  LoginView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import SwiftUI
import StreamChat

struct LoginView: View {
  @State private var username: String = ""
  @State private var success: Bool?
  
  var body: some View {
    NavigationView {
      VStack {
        LoginHeaderView()
        
        VStack(alignment: .leading) {
          Text("Username")
            .font(.headline)
          
          TextField("Enter username", text: $username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
              
        NavigationLink(destination: ChatView(), tag: true, selection: $success) {
          EmptyView()
        }
        
        Button("Log in".uppercased(), action: login)
          .buttonStyle(AuthenticationButtonStyle())
      }
    }
    .edgesIgnoringSafeArea(.top)
  }
  
  private func login() {
    ChatClient.shared.tokenProvider = .development(userId: username)
    
    ChatClient.shared.currentUserController().reloadUserIfNeeded { error in
      switch error {
      case .none:
        success = true
      case .some:
        success = false
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
