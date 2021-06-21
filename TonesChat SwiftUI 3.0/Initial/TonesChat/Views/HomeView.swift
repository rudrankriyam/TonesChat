//
//  HomeView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 28/05/21.
//

import SwiftUI

struct HomeView: View {
  @StateObject private var viewModel = TopSongsViewModel()
  
  var body: some View {
    NavigationView {
      MusicGridView(viewModel: viewModel)
        .navigationTitle("TonesChat")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .onAppear {
      viewModel.updateTopSongs()
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
