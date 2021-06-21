//
//  SearchBar.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 31/05/21.
//

import SwiftUI

struct SearchBar: View {
  @Binding var searchText: String
  @Binding var showCancelButton: Bool
  
  var onCommit: () -> ()
  
  var body: some View {
    HStack {
      HStack {
        Image(systemName: "magnifyingglass")
        
        TextField("Search", text: $searchText, onEditingChanged: { isEditing in
          showCancelButton = true
        }, onCommit: onCommit)
        .foregroundColor(.primary)
        
        Button(action: { searchText = "" }) {
          Image(systemName: "xmark.circle.fill")
            .opacity(searchText == "" ? 0 : 1)
            .accessibility(hidden: searchText == "")
        }
      }
      .padding()
      .foregroundColor(.secondary)
      .background(Color(.secondarySystemBackground))
      .cornerRadius(16)
      
      if showCancelButton {
        Button("Cancel") {
          UIApplication.shared.endEditing(true)
          searchText = ""
          showCancelButton = false
        }
        .foregroundColor(.brand)
      }
    }
  }
}

struct SearchBar_Previews: PreviewProvider {
  static var previews: some View {
    SearchBar(searchText: .constant("Hello"), showCancelButton: .constant(true), onCommit: {})
  }
}

extension UIApplication {
  func endEditing(_ force: Bool) {
    self
      .windows
      .filter { $0.isKeyWindow }
      .first?
      .endEditing(force)
  }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
  var gesture = DragGesture().onChanged { _ in
    UIApplication.shared.endEditing(true)
  }
  
  func body(content: Content) -> some View {
    content.gesture(gesture)
  }
}

extension View {
  func resignKeyboardOnDragGesture() -> some View {
    return modifier(ResignKeyboardOnDragGesture())
  }
}
