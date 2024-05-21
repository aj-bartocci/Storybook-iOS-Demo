//
//  SomeOtherComponent.swift
//  StorybookIOSDemo
//
//  Created by AJ Bartocci on 8/17/22.
//

import SwiftUI

@available(iOS 13, *)
struct SomeOtherComponent: View {
    
    @State var email = ""
    @State var password = ""
    
    var buttonIsDisabled: Bool {
        return email.isEmpty || password.isEmpty
    }
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: submit, label: {
                Text("Sign In")
            })
            .disabled(buttonIsDisabled)
        }
        .padding()
    }
    
    func submit() {
        
    }
}

import Storybook
import SwiftUIPreviewHelpers

@available(iOS 14, *)
struct SomeOtherComponent_Previews: PreviewProvider {
    
    // For some reason the keyboard doesn't work for the text fields
    // in preview depending on your xcode version -- Apple SwiftUI Bug
    // https://developer.apple.com/forums/thread/652463
    
    static func base() -> some View {
        SomeOtherComponent()
        .previewSize(height: 200)
    }
    
    static func light() -> some View {
        base()
        .previewInLightMode()
    }
    
    static func dark() -> some View {
        base()
        .previewInDarkMode()
    }
    
    static var previews: some View {
        Group {
            light()
            dark()
        }
    }
}

@available(iOS 14, *)
extension Storybook {
    @objc static let someOtherComponent = StorybookPage(
        folder: "/* V2 Improvements/General Components",
        view: SomeOtherComponent_Previews.base().storybookTitle("Some Other Component with controls")
    )
    
    @objc static let someOtherComponentOld = StorybookPage(
        title: "Some Other Component",
        chapter: "General Components",
        views: [
            StoryBookView(title: "Light", view: SomeOtherComponent_Previews.light()),
            StoryBookView(title: "Dark", view: SomeOtherComponent_Previews.dark())
        ]
    )
}
