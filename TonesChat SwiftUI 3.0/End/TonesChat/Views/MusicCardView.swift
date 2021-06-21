//
//  MusicCardView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 27/05/21.
//

import SwiftUI

struct MusicCardView: View {
  var song: SongData
  
  var body: some View {
    HStack {
      ArtworkImage(url: url) { image in
        image
          .scaledToFit()
          .transition(.opacity.combined(with: .scale))
      }
      .cornerRadius(12.0)
      .frame(width: 100.0, height: 100.0)
      
      VStack(alignment: .leading, spacing: 4.0) {
        Text(name)
          .fontWeight(.bold)
          .font(.callout)
        
        Text(artistName)
          .fontWeight(.light)
          .font(.caption)
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity, alignment: .leading)
      .multilineTextAlignment(.leading)
      .padding(.horizontal)
    }
  }
  
  private var name: String {
    song.attributes.name
  }
  
  private var artistName: String {
    song.attributes.artistName
  }
  
  private var url: URL? {
    URL(string: song.attributes.artwork.url, width: 300, height: 300)
  }
}
