//
//  MusicGridView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 27/05/21.
//

import SwiftUI
import MediaPlayer

struct MusicGridView: View {
  @ObservedObject var viewModel: SongsViewModel
  
  var player = MPMusicPlayerController.applicationQueuePlayer
  var items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVGrid(columns: items, spacing: 4) {
        ForEach(viewModel.songs, id: \.id) { song in
          MusicCardView(song: song)
            .onTapGesture(count: 2) {
              setSong(with: song.id)
            }
            .onLongPressGesture {
              copyToClipboard(string: song.attributes.name)
            }
        }
      }
      .padding()
    }
  }
  
  private func setSong(with id: String) {
    switch player.playbackState {
    case .stopped, .paused:
      player.setQueue(with: [id])
      player.play()
    default:
      player.stop()
    }
    
    successNotification()
  }
  
  private func copyToClipboard(string: String) {
    UIPasteboard.general.string = string
    
    successNotification()
  }
  
  private func successNotification() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
  }
}

struct MusicGridView_Previews: PreviewProvider {
  static var previews: some View {
    MusicGridView(viewModel: SongsViewModel())
  }
}
