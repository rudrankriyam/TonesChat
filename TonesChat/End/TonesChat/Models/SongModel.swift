//
//  SongModel.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 27/05/21.
//

import Foundation

// MARK: - SongModel
struct SongModel: Codable {
  let results: SongResults
}

// MARK: - SearchSongModel
struct SearchSongModel: Codable {
  let results: SearchSongResults
}

// MARK: - SearchSongResults
struct SearchSongResults: Codable {
  let songs: Song
}

// MARK: - SongResults
struct SongResults: Codable {
  let songs: [Song]
}

// MARK: - Song
struct Song: Codable {
  let data: [SongData]
}

// MARK: - SongData
struct SongData: Codable {
  let id: String
  let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
  let name: String
  let albumName: String
  let artwork: Artwork
  let artistName: String
}

// MARK: - Artwork
struct Artwork: Codable {
  let height: Int
  let width: Int
  let url: String
}
