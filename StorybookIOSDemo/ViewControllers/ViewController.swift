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
    }
}

import SwiftUI
import SwiftUIPreviewHelpers
import Storybook

@available(iOS 14, *)
struct ViewController_Previews: PreviewProvider {
    
    static func light() -> some View {
        UIViewControllerPreview {
            ViewController()
        }
        .previewInLightMode()
    }
    
    static func dark() -> some View {
        UIViewControllerPreview {
            ViewController()
        }
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
        title: "ViewController",
        chapter: "Some Feature",
        views: [
            StoryBookView(title: "Light", view: ViewController_Previews.light()),
            StoryBookView(title: "Dark", view: ViewController_Previews.dark())
        ]
    )
}
