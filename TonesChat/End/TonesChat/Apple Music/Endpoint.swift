//
//  Endpoint.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import Foundation

enum Endpoint {
  case chart
  case search(term: String)
  
  var url: URL {
    switch self {
    case .chart:
      return "charts".createURLForComponents()
    case .search(let term):
      let encodedTerm = term.replacingOccurrences(of: " ", with: "+")
      let queryItem = URLQueryItem(name: "term", value: encodedTerm)
      
      return "search".createURLForComponents(query: queryItem)
    }
  }
}
