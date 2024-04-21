//
//  RootCore.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI
import ComposableArchitecture

struct RootCore: Reducer {
  
  // MARK: Lifecycle
  init() {}
  
  // MARK: Public
  
  struct State {
    var isLoading: Bool = false
    var movieHomeState: MovieHomeCore.State = .init()
  }
  
  public enum Action {
    /// Life Cycle
    case onLoad
    case onAppear
    case onDisappear
    case isLoading(Bool)
    case movieHomeAction(MovieHomeCore.Action)
  }
  
  public var body: some ReducerOf<Self> {
    
    Reduce<State, Action> { state, action in
      switch action {
      case .onAppear:
        return .none
      case .onDisappear:
        return .none
      case .onLoad:
        return .none
      case .isLoading(let isLoading):
        state.isLoading = isLoading
        return .none
      case .movieHomeAction(_):
        return .none
      }
    }
    
    Scope(state: \.movieHomeState, action: /Action.movieHomeAction) {
      MovieHomeCore()
    }
  }
  
  // MARK: Dependency
  @Dependency(\.mainQueue) var mainQueue
  @Dependency(\.appService) var appService
}
