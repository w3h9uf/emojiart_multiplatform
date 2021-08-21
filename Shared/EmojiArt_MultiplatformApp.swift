//
//  EmojiArt_MultiplatformApp.swift
//  Shared
//
//  Created by Jizheng Yang on 8/21/21.
//
import SwiftUI

@main
struct EmojiArtApp: App {
  @StateObject var paletteStore = PaletteStore(named: "default")
  var body: some Scene {
    DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
      EmojiArtDocumentView(document: config.document)
            .environmentObject(paletteStore)
      }
  }
}

