//
//  TabViewItem.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import SwiftUI

enum TabViewItemType: String {
  case home
  case search
  case chat
  
  var image: String {
    switch self {
    case .home: return "music.note.list"
    case .search: return "magnifyingglass"
    case .chat: return "captions.bubble"
    }
  }
  
  var name: String {
    rawValue.capitalized
  }
}

struct TabViewItem: View {
  var type: TabViewItemType
  
  var body: some View {
    Label(type.name, systemImage: type.image)
  }
}
