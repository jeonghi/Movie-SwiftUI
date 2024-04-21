//
//  AppService.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import Dependencies

struct AppService {
  
  static let shared = AppService()
  
  private init(){

  }
}

extension DependencyValues {
  var appService: AppService {
    get { self[AppService.self] }
    set { self[AppService.self] = newValue }
  }
}

extension AppService: DependencyKey {
  static let liveValue = AppService.shared
}
