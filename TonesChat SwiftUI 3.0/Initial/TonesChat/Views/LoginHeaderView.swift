//
//  LoginHeaderView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import SwiftUI

struct LoginHeaderView: View {
  var body: some View {
    VStack {
      Image("login_header_image")
        .resizable()
        .aspectRatio(contentMode: .fit)
      
      Text("Welcome to Music Paradise!")
        .fontWeight(.black)
        .foregroundColor(.brand)
        .font(.largeTitle)
        .multilineTextAlignment(.center)
      
      Text("Share your exceptional music taste with the world.")
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()
    }
  }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
    }
}

struct AuthenticationButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .foregroundColor(.white)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.brand)
      .cornerRadius(12)
      .padding()
  }
}
