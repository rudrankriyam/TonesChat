//
//  ArtworkImage.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 16/06/21.
//

import SwiftUI

struct ArtworkImage<Content>: View where Content: View {
  private let url: URL?
  private var content: (_ image: Image) -> Content
  
  public init(url: URL?, @ViewBuilder content: @escaping (_ image: Image) -> Content) {
    self.url = url
    self.content = content
  }
  
  var body: some View {
    if let url = url {
      AsyncImage(url: url, transaction: .init(animation: .spring())) { phase in
        switch phase {
        case .empty: progressView()
        case .success(let image): content(image.resizable())
        case .failure(let error as NSError): errorView(with: error)
        @unknown default: unknownView()
        }
      }
    } else {
      Text("Wrong URL")
    }
  }
  
  private func progressView() -> some View {
    ProgressView().transition(.opacity.combined(with: .scale))
  }
  
  private func errorView(with error: NSError) -> some View {
    ZStack {
      Color.red.transition(.opacity.combined(with: .scale))
      
      Text(error.localizedDescription).foregroundColor(.white)
    }
    .transition(.opacity.combined(with: .scale))
  }
  
  private func unknownView() -> some View {
    Color.gray.transition(.opacity.combined(with: .scale))
  }
}
