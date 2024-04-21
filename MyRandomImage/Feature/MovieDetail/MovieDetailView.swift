//
//  MovieDetail.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI
import ComposableArchitecture

// MARK: Base
struct MovieDetailView: BaseFeature {
  
  typealias Core = MovieDetailCore
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
extension MovieDetailView: View {
  var body: some View {
    VStack {
      
    }
    .onLifeCycle(
      onLoad: {viewStore.send(.onLoad)},
      onAppear: {viewStore.send(.onAppear)},
      onDisappear: {viewStore.send(.onDisappear)}
    )
  }
}

// MARK: View Component
extension MovieDetailView {
  
}

// MARK: Store init
extension MovieDetailView {

}
