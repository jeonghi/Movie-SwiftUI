//
//  MovieHomeView.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI
import ComposableArchitecture

// MARK: Base
struct MovieHomeView: BaseFeature {
  
  typealias Core = MovieHomeCore
  typealias State = Core.State
  typealias Action = Core.Action
  typealias Section = Core.Section
  
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
extension MovieHomeView: View {
  var body: some View {
    ZStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          layout
        }
      }
      .refreshable {
        
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
extension MovieHomeView {
  
  private func sectionHeader(for section: Section) -> some View {
    Text("\(section.rawValue)")
  }
  
  private func sectionView(for section: Section) -> some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(alignment: .center, spacing: 20) {
        ForEach(1...10, id: \.self) { _ in
          moviePoster(for: section)
        }
      }
    }
  }
  
  private func moviePoster(for section: Section) -> some View {
    Button(action: {
      viewStore.send(.tappedImage(section))
    }) {
      let image = AsyncImage(url: URL(string: "https://picsum.photos/200/300"))
        .frame(width: 140, height: 210)
        .aspectRatio(3/2, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        .clipShape(.rect(cornerRadius: 8, style: .circular))
      return image
    }
  }
  
  private var layout: some View {
    ForEach(Section.allCases, id: \.self) { section in
      VStack(alignment: .leading, spacing: 10) {
        sectionHeader(for: section)
        sectionView(for: section)
      }
    }
  }
}

// MARK: Store init
extension MovieHomeView {
  
}

@available(iOS 17.0, *)
#Preview {
  let store = StoreOf<MovieHomeCore>.init(initialState: MovieHomeCore.State()) {
    MovieHomeCore()
  }
  return MovieHomeView(store: store)
}
