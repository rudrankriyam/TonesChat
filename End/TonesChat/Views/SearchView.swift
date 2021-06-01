//
//  SearchView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 30/05/21.
//

import SwiftUI

struct SearchView: View {
  @State private var searchText = ""
  @State private var showCancelButton: Bool = false
  
  @StateObject private var viewModel = SearchSongsViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchText: $searchText, showCancelButton: $showCancelButton) {
          UIApplication.shared.resignFirstResponder()
          if self.searchText.isEmpty {
            viewModel.songs = []
          } else {
            viewModel.updateSearchSongs(for: searchText)
          }
        }
        
        MusicGridView(viewModel: viewModel)
      }
      .padding()
      .navigationTitle("Search")
      .navigationBarHidden(showCancelButton)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
