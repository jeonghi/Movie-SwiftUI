//
//  RootView.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI
import ComposableArchitecture

// MARK: Base
struct RootView: BaseFeature {
  
  typealias Core = RootCore
  typealias State = Core.State
  typealias Action = Core.Action
  
  internal let store: StoreOf<Core>
  @ObservedObject var viewStore: ViewStore<ViewState, Action>
  
  struct ViewState: Equatable {
        
    init(state: State){
    }
  }
  
  init(store: StoreOf<Core>){
    self.store = store
    self.viewStore = ViewStore(store, observe: ViewState.init)
  }
}

// MARK: View Layout
extension RootView: View {
  var body: some View {
    ZStack {
      NavigationStack {
        MovieHomeView(store: movieHomeStore)
      }
    }
    .onLifeCycle(
      onLoad: {viewStore.send(.onLoad)},
      onAppear: {viewStore.send(.onAppear)},
      onDisappear: {viewStore.send(.onDisappear)}
    )
  }
}

// MARK: View Component
extension RootView {
  
}

// MARK: Store init
extension RootView {
  private var movieHomeStore: StoreOf<MovieHomeCore> {
    return store.scope(state: \.movieHomeState, action: Action.movieHomeAction)
  }
}

@available(iOS 17.0, *)
#Preview {
  let store = StoreOf<RootCore>.init(initialState: RootCore.State()) {
    RootCore()
  }
  return RootView(store: store)
}
