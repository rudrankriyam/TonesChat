//
//  ContentView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 26/05/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      HomeView()
        .tabItem { TabViewItem(type: .home) }
      
      SearchView()
        .tabItem { TabViewItem(type: .search) }
      
      LoginView()
        .tabItem { TabViewItem(type: .chat) }
    }
    .accentColor(.brand)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
