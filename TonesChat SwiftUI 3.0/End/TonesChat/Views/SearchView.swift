//
//  SearchView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 30/05/21.
//

import SwiftUI

struct SearchView: View {
  @StateObject private var viewModel = SearchSongsViewModel()
  @State private var searchText = ""
  @State private var selectedHint = ""
  
  var body: some View {
    NavigationView {
      VStack {
        if searchText.isEmpty {
          Image("empty_search")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        } else {
          MusicGridView(viewModel: viewModel)
        }
      }
      .navigationTitle("Search")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .searchable(text: $searchText) {
      ForEach(viewModel.searchHints, id: \.self) { hint in
        Button(hint) {
          viewModel.updateSearchSongs(for: hint)
          
          selectedHint = hint
          searchText = hint
        }
      }
    }
    .onSubmit(of: .search) {
      viewModel.updateSearchSongs(for: searchText)
    }
    .onChange(of: searchText) { _ in
      updateSearchList()
    }
  }
  
  private func updateSearchList() {
    if searchText.isEmpty {
      viewModel.songs = []
      viewModel.searchHints = []
    } else {
      if selectedHint != searchText {
        viewModel.updateSearchHints(for: searchText)
      }
    }
  }
}
