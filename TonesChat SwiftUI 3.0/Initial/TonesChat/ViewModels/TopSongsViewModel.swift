//
//  TopSongsViewModel.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import Foundation

class TopSongsViewModel: SongsViewModel {
  func updateTopSongs() {
    requestAuthorization { status in
      if status {
        self.cancellable = AppleMusicManager.shared.getTopSongs()
          .sink(receiveCompletion: { _ in
          }, receiveValue: { model in
            if let songs = model.results.songs.first {
              self.songs = songs.data
            }
          })
      }
    }
  }
}
