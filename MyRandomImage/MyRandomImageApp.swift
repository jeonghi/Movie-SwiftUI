//
//  MyRandomImageApp.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyRandomImageApp: App {
    var body: some Scene {
      
      let rootStore = StoreOf<RootCore>.init(
        initialState: RootCore.State()
      ) {
        RootCore()
      }
      
      WindowGroup {
        RootView(store: rootStore)
      }
    }
}

