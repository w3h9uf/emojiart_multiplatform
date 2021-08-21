//
//  iOS.swift
//  EmojiArt-Multiplatform
//
//  Created by Jizheng Yang on 8/21/21.
//

import SwiftUI

extension View {
  @ViewBuilder
  func wrappedInNavigationViewToMakeDismissable(_ dismiss: (() -> Void)?) -> some View {
    if UIDevice.current.userInterfaceIdiom != .pad, let dismiss = dismiss {
      NavigationView {
        self
          .navigationBarTitleDisplayMode(.inline)
          .dismissable(dismiss)
      }
      .navigationViewStyle(StackNavigationViewStyle())
    } else {
      self
    }
  }
  
  @ViewBuilder
  func dismissable(_ dismiss: (() -> Void)?) -> some View {
    if UIDevice.current.userInterfaceIdiom != .pad, let dismiss = dismiss {
      self.toolbar(content: {
        ToolbarItem(placement: .cancellationAction) {
          Button("Close") { dismiss() }
        }
      })
    } else {
      self
    }
  }
  
  func paletteControlButtonStyle() -> some View {
    self
  }
  
  func popoverPadding() -> some View {
    self
  }
}

extension UIImage {
  var imageData: Data? { jpegData(compressionQuality: 1.0) }
}

struct PasteBoard {
  static var imageData: Data? {
    UIPasteboard.general.image?.imageData
  }
  static var imageURL: URL? {
    UIPasteboard.general.url?.imageURL
  }
}
