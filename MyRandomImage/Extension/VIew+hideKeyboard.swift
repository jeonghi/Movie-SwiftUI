//
//  VIew+hideKeyboard.swift
//  MyRandomImage
//
//  Created by 쩡화니 on 4/21/24.
//

import SwiftUI

extension View {
  
  /// 주변 터치시 키보드 내리기
  func hideKeyboardWhenTappedAround() -> some View {
    return self.onTapGesture {
      UIApplication.shared.sendAction(
        #selector(UIResponder.resignFirstResponder),
        to: nil,
        from: nil,
        for: nil
      )
    }
  }
  
  /// 드래그시 키보드 내리기
  func hideKeyboardOnDrag() -> some View {
    return self.gesture(DragGesture().onChanged { _ in
      self.hideKeyboard()
    })
  }
  
  /// 키보드 내리기
  func hideKeyboard() {
    let resign = #selector(UIResponder.resignFirstResponder)
    UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
  }
}
