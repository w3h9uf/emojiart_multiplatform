//
//  macOS.swift
//  EmojiArt-Multiplatform
//
//  Created by Jizheng Yang on 8/21/21.
//

import SwiftUI

typealias UIImage = NSImage

typealias PaletteManager = EmptyView

extension UIImage {
  var imageData: Data? { tiffRepresentation }
}

extension Image {
  init(uiImage: UIImage) {
    self.init(nsImage: uiImage)
  }
}

extension View {
  @ViewBuilder
  func wrappedInNavigationViewToMakeDismissable(_ dismiss: (() -> Void)?) -> some View {
    self
  }
  
  func paletteControlButtonStyle() -> some View {
    self.buttonStyle(PlainButtonStyle()).foregroundColor(.accentColor).padding(.vertical)
  }
  
  func popoverPadding() -> some View {
    self.padding(.horizontal)
  }
}

struct CantDoItPhotoPicker: View {
  var handlePickedImage: (UIImage?) -> Void
  
  static let isAvailable = false
  var body: some View {
    EmptyView()
  }
}


struct PasteBoard {
  static var imageData: Data? {
    NSPasteboard.general.data(forType: .tiff) ?? NSPasteboard.general.data(forType: .png)
  }
  static var imageURL: URL? {
    (NSURL(from: NSPasteboard.general) as URL?)?.imageURL
  }
}

typealias Camera = CantDoItPhotoPicker
typealias PhotoLibrary = CantDoItPhotoPicker
