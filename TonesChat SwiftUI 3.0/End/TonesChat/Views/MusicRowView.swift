//
//  MusicRowView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 16/06/21.
//

import SwiftUI

struct MusicRowView: View {
  var song: SongData
    
  var body: some View {
    ZStack {
      ArtworkImage(url: url) { image in
        image
          .scaledToFill()
          .layoutPriority(-1)
          .overlay(Color.black.opacity(0.5))
          .transition(.opacity.combined(with: .scale))
      }
      
      MusicCardView(song: song)
        .background(.thinMaterial)
    }
    .cornerRadius(12.0)
    .padding(4.0)
  }
  
  private var url: URL? {
    URL(string: song.attributes.artwork.url, width: 300, height: 300)
  }
}
