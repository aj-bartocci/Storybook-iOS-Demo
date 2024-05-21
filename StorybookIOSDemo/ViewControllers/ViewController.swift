//
//  ViewController.swift
//  StorybookIOSDemo
//
//  Created by AJ Bartocci on 8/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        let label = UILabel()
        label.text = "Hello, World!"
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.rightAnchor.constraint(equalTo: view.rightAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.backgroundColor = .theme(.backgroundPrimary)
        label.textColor = .theme(.textPrimary)
        label.font = .preferredFont(forTextStyle: .body)
    }
}

import SwiftUI
import SwiftUIPreviewHelpers
import Storybook

@available(iOS 14, *)
struct ViewController_Previews: PreviewProvider {
    
    static func baseView() -> some View {
        UIViewControllerPreview {
            ViewController()
        }
    }
    
    static func light() -> some View {
        baseView()
        .previewInLightMode()
    }
    
    static func dark() -> some View {
        baseView()
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
    
    @objc static let viewController = StorybookPage(
        folder: "/* V2 Improvements/Some Feature",
        views: [
            ViewController_Previews.baseView().storybookTitle("ViewController with controls")
        ]
    )
    
    @objc static let viewControllerOld = StorybookPage(
        title: "ViewController",
        chapter: "Some Feature",
        views: [
            StoryBookView(title: "Light", view: ViewController_Previews.light()),
            StoryBookView(title: "Dark", view: ViewController_Previews.dark())
        ]
    )
}
