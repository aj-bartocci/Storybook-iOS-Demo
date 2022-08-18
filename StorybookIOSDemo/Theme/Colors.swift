//
//  Colors.swift
//  StorybookIOSDemo
//
//  Created by AJ Bartocci on 8/17/22.
//

import Foundation
import UIKit

enum ColorAsset: CaseIterable {
    case backgroundPrimary
    case backgroundSecondary
    case textPrimary
    case textSecondary
}

extension ColorAsset {
    func load() -> UIColor {
        switch self {
        case .backgroundPrimary:
            if #available(iOS 13, *) {
                return .systemBackground
            } else {
                return .white
            }
        case .backgroundSecondary:
            if #available(iOS 13, *) {
                return .secondarySystemBackground
            } else {
                return .lightGray
            }
        case .textPrimary:
            if #available(iOS 13, *) {
                return .label
            } else {
                return .black
            }
        case .textSecondary:
            if #available(iOS 13, *) {
                return .secondaryLabel
            } else {
                return .lightGray
            }
        }
    }
}

extension UIColor {
    static func theme(_ asset: ColorAsset) -> UIColor {
        return asset.load()
    }
}

import SwiftUI
import Storybook

@available(iOS 13, *)
struct ColorPalette: View {
    var body: some View {
        List {
            ForEach(ColorAsset.allCases, id: \.hashValue) { color in
                HStack {
                    Color(color.load())
                    .frame(width: 60, height: 60)
                    .border(Color.black)
                    Text(String(describing: color))
                }
            }
        }
    }
}

@available(iOS 13, *)
struct ColorPalette_Previews: PreviewProvider {
    static var previews: some View {
        ColorPalette()
    }
}

@available(iOS 13, *)
extension Storybook {
    private static func darkColorPalette() -> some View {
        ColorPalette()
        .preferredColorScheme(.dark)
    }
    
    private static func lightColorPalette() -> some View {
        ColorPalette()
        .preferredColorScheme(.light)
    }
    
    @objc static let colorPalette = StorybookPage(
        title: "Color Palette",
        chapter: "Design",
        views: [
            StoryBookView(title: "Light Mode", view: lightColorPalette()),
            StoryBookView(title: "Dark Mode", view: darkColorPalette())
        ]
    )
}
