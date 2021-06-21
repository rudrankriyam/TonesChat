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
  
  var body: some View {
    List {
      ForEach(viewModel.songs.shuffled(), id: \.id) { song in
        MusicRowView(song: song)
          .swipeActions(edge: .leading) {
            Button {
              withAnimation {
                // Mark the song favorite
              }
            } label: {
              Label("Favorite", systemImage: "star")
            }
            .tint(.brand)
          }
          .onTapGesture(count: 2) {
            setSong(with: song.id)
          }
          .onLongPressGesture {
            copyToClipboard(string: song.attributes.name)
          }
        
      }
      .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
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
