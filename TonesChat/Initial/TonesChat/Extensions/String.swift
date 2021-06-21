//
//  String.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import Foundation

extension String {
  func createURLForComponents(query: URLQueryItem? = nil) -> URL {
    var components = URLComponents()
    
    var queryItems: [URLQueryItem] = []
    
    if let query = query {
      queryItems.append(query)
    }
    
    queryItems.append(URLQueryItem(name: "types", value: "songs"))
    
    components.scheme = "https"
    components.host = "api.music.apple.com"
    components.path = "/v1/catalog/in/" + self
    components.queryItems = queryItems
    
    return components.url!
  }
}
