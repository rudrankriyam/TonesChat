//
//  SongsViewModel.swift
//  TonesChat
//
//  Created by Rudrank Riyam on 27/05/21.
//

import StoreKit
import Combine

class SongsViewModel: ObservableObject {
  var cancellable: AnyCancellable?
  @Published var songs: [SongData] = []
  
  func requestAuthorization(completion: @escaping (Bool) -> ()) {
    SKCloudServiceController.requestAuthorization { (status) in
      completion(status == .authorized ? true : false)
    }
  }
}
