//
//  URL.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 16/06/21.
//

import Foundation

extension URL {
  init?(string: String?, width: Int, height: Int) {
    guard let string = string else { return nil }
    
    self.init(string: string
          .replacingOccurrences(of: "{w}", with: "\(width)")
          .replacingOccurrences(of: "{h}", with: "\(height)"))
  }
}
