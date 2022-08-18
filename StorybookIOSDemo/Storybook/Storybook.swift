//
//  Storybook.swift
//  StorybookIOSDemo
//
//  Created by AJ Bartocci on 8/17/22.
//

import SwiftUI
import Storybook
import SwiftUIPreviewHelpers

@available(iOS 13, *)
struct Storybook_Preview: PreviewProvider {
    static var previews: some View {
        StorybookCollection()
    }
}
