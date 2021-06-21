//
//  SearchSongsViewModel.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import Foundation

class SearchSongsViewModel: SongsViewModel {
  func updateSearchSongs(for term: String) {
    requestAuthorization { status in
      if status {
        self.cancellable = AppleMusicManager.shared.getSearchSongs(for: term)
          .sink(receiveCompletion: { _ in
          }, receiveValue: { model in
            self.songs = model.results.songs.data
          })
      }
    }
  }
}
