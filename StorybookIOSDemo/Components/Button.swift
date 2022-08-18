//
//  Button.swift
//  StorybookIOSDemo
//
//  Created by AJ Bartocci on 8/17/22.
//

import UIKit

class SomeButton: UIControl {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.textColor = .theme(.backgroundPrimary)
        self.backgroundColor = .systemOrange

        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14)
        ])
        
        self.layer.cornerRadius = 8
    }
    
    func setTitle(_ text: String) {
        self.label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.alpha = 0.7
            } else {
                self.alpha = 1
            }
        }
    }
}

import SwiftUI
import SwiftUIPreviewHelpers
import Storybook

@available(iOS 14, *)
struct SomeButton_Previews: PreviewProvider {
    static func light() -> some View {
        UIViewPreview {
            let button = SomeButton()
            button.setTitle("Foo!")
            return button
        }
        .padding()
        .previewSize(height: 80)
        .previewInLightMode()
    }
    
    static func dark() -> some View {
        UIViewPreview {
            let button = SomeButton()
            button.setTitle("Foo!")
            return button
        }
        .padding()
        .previewSize(height: 80)
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
    @objc static let someButton = StorybookPage(
        title: "Button",
        chapter: "General Components",
        views: [
            StoryBookView(title: "Light", view: SomeButton_Previews.light()),
            StoryBookView(title: "Dark", view: SomeButton_Previews.dark())
        ]
    )
}
