//
//  SomeComponent.swift
//  StorybookIOSDemo
//
//  Created by AJ Bartocci on 8/17/22.
//

import UIKit

class SomeComponent: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.backgroundColor = .theme(.backgroundSecondary)
        self.titleLabel.textColor = .theme(.textPrimary)
        self.subtitleLabel.textColor = .theme(.textSecondary)
        
        stackView.axis = .vertical
        titleLabel.numberOfLines = 1
        subtitleLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI
import SwiftUIPreviewHelpers
import Storybook

@available(iOS 14, *)
struct SomeComponent_Previews: PreviewProvider {
    
    static func base() -> some View {
        UIViewPreview {
            let component = SomeComponent()
            component.titleLabel.text = "Some Title"
            component.subtitleLabel.text = "Some subtitle"
            return component
        }
        .padding()
    }
    
    static func light() -> some View {
        base()
        .previewSize(height: 100)
        .previewInLightMode()
    }
    
    static func dark() -> some View {
        base()
        .previewSize(height: 100)
        .previewInDarkMode()
    }
    
    static func multilineSubtitle() -> some View {
        UIViewPreview {
            let component = SomeComponent()
            component.titleLabel.text = "Some Title"
            component.subtitleLabel.text = "Some\nmultiline\nsubtitle"
            return component
        }
        .padding()
        .previewSize(height: 200)
        .previewInDarkMode()
    }
    
    static var previews: some View {
        Group {
            light()
            dark()
            multilineSubtitle()
        }
    }
}

@available(iOS 14, *)
struct ControlledSomeComponent: View {
    @State var title = "Some Title"
    @State var subtitle = "Some subtitle"
    
    var body: some View {
        UIViewPreview {
            let component = SomeComponent()
            component.titleLabel.text = title
            component.subtitleLabel.text = subtitle
            return component
        }
        // UIViewPreview needs to be forced to update
        // since the state lives outside of UIKit
        .id(title + subtitle)
        .padding()
        .storybookAddControls(
            .custom(StorybookControl(
                id: "SomeComponentControl",
                view: {
                    VStack(alignment: .leading) {
                        TextFieldControl(placeholder: "Title", text: $title)
                        TextFieldControl(placeholder: "Subtitle", text: $subtitle)
                    }
                    .font(.system(size: 16))
                }
            ))
        )
    }
}

@available(iOS 14, *)
extension Storybook {
    @objc static let someComponent = StorybookPage(
        folder: "/* V2 Improvements/Some Feature",
        view: ControlledSomeComponent().storybookTitle("Some Component with controls")
    )
    
    @objc static let someComponentOld = StorybookPage(
        title: "Some Component",
        chapter: "Some Feature",
        views: [
            StoryBookView(title: "Light", view: SomeComponent_Previews.light()),
            StoryBookView(title: "Dark", view: SomeComponent_Previews.dark()),
            StoryBookView(title: "Long subtitle", view: SomeComponent_Previews.multilineSubtitle())
        ]
    )
}
