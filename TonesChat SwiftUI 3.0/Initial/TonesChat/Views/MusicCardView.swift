//
//  MusicCardView.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 27/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MusicCardView: View {
  var song: SongData
  
  var body: some View {
    VStack(spacing: 0) {
      WebImage(url: url)
        .resizable()
        .scaledToFit()
      
      VStack(spacing: 4) {
        Text(name.uppercased()).bold()
        Text(artistName.uppercased())
      }
      .cardBackground()
    }
    .cornerRadius(12)
    .padding(4)
    
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
