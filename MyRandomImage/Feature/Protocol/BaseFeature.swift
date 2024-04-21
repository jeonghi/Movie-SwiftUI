//
//  BaseFeature.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import ComposableArchitecture

protocol BaseFeature {
  associatedtype Core: Reducer
  typealias State = Core.State
  typealias Action = Core.Action
  associatedtype ViewState: Equatable
  var store: StoreOf<Core> { get }
  var viewStore: ViewStore<ViewState, Action> { get }
}
