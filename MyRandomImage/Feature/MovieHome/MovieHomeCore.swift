//
//  MovieHomeCore.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI
import ComposableArchitecture

struct MovieHomeCore: Reducer {
  
  // MARK: Lifecycle
  
  init() {}
  
  // MARK: Public
  
  struct State {
    var isLoading: Bool = false
  }
  
  enum Route {
    case detail
  }
  
  enum Section: String, CaseIterable {
    case first = "첫번째"
    case second = "두번째"
    case third = "세번째"
  }
  
  public enum Action {
    /// Life Cycle
    case onLoad
    case onAppear
    case onDisappear
    case isLoading(Bool)
    case tappedImage(Section)
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
      case .tappedImage(let section):
        return .none
      }
    }
  }
  
  // MARK: Dependency
  @Dependency(\.mainQueue) var mainQueue
  @Dependency(\.appService) var appService
}
