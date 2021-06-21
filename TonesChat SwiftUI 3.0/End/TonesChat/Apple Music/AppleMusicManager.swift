//
//  AppleMusicManager.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 26/05/21.
//

import Combine
import Foundation
import StoreKit

class AppleMusicManager {
  static let shared = AppleMusicManager()
  
  // MARK:- Save this in Keychain
  private let developerToken = "JWT GOES HERE"
  
  func getSearchSongs(for term: String) -> AnyPublisher<SearchSongModel, Error> {
    execute(request: createURLRequest(with: .search(term: term)))
  }
  
  func getSearchHints(for term: String) -> AnyPublisher<SearchHintsModel, Error> {
    execute(request: createURLRequest(with: .hints(term: term)))
  }
  
  func getTopSongs() -> AnyPublisher<SongModel, Error> {
    execute(request: createURLRequest(with: .chart))
  }
  
  private func execute<T: Codable>(request: URLRequest) -> AnyPublisher<T, Error> {
    URLSession.shared
      .dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: T.self, decoder: JSONDecoder())
      .receive(on: RunLoop.main)
      .eraseToAnyPublisher()
  }
  
  private func createURLRequest(with endpoint: Endpoint) -> URLRequest {
    var request = URLRequest(url: endpoint.url)
    request.httpMethod = "GET"
    request.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
    return request
  }
}
