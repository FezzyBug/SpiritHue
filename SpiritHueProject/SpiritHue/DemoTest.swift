//
//  DemoTest.swift
//  SpiritHue
//
//  Created by Jozef Vargas on 3/31/23.
//

//import Foundation
//
//
//import UIKit
//
//class DemoTest: UIViewController {
//
//
//        init(textBlocks: [String]) {
//            self.textBlocks = textBlocks
//            super.init(nibName: nil, bundle: nil)
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//
//    func updateTextBlocks(with newStrings: [String]) {
//            textBlocks = newStrings
//        }
//
//    var newTextBlocks: [String]?
//
//
//
//    var animator: UIViewPropertyAnimator?
//    let stackView = UIStackView()
//    let scrollView = UIScrollView()
//
//    var textBlocks = ["This is the first block of text.",
//                      "This is the second block of text.",
//                      "This is the third block of text.",
//                      "This is the fifth block of text."
//
//                      ]
//
//    let labelHeight: CGFloat = 30.0
//    let labelWidth: CGFloat = 250.0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Add the scroll view and stack view to the view controller's view
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        scrollView.addSubview(stackView)
//
//        // Set up the constraints for the scroll view and stack view
//        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//        ])
//
//        // Set up stack view properties
//        stackView.axis = .vertical
//        stackView.alignment = .center
//
//        // Add labels to the stack view
//        for textBlock in textBlocks {
//            let label = UILabel()
//            label.text = textBlock
//            label.font = UIFont.systemFont(ofSize: 18.0)
//            label.textColor = UIColor.black
//            label.numberOfLines = 0
//            label.textAlignment = .center
//            label.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(label)
//
//            NSLayoutConstraint.activate([
//                label.widthAnchor.constraint(equalToConstant: labelWidth),
//                label.heightAnchor.constraint(equalToConstant: labelHeight)
//            ])
//        }
//
//        // Set up automatic scrolling
//                let contentHeight = CGFloat(textBlocks.count) * labelHeight
//                let scrollViewHeight = scrollView.frame.size.height
//                let padding = max(100, (scrollViewHeight - contentHeight) / 2.0)
//                scrollView.contentInset = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
//
//                let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
//                    guard let self = self else { return }
//
//                    if let firstLabel = self.stackView.arrangedSubviews.first {
//                        let convertedMaxY = self.scrollView.convert(CGPoint(x: 0.0, y: firstLabel.frame.maxY), from: firstLabel.superview).y
//
//                        if convertedMaxY > 50 {
//                            // Move the content up with smooth animation
//                            self.animator?.stopAnimation(true)
//                            self.animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
//                                let offset = CGPoint(x: 0.0, y: self.scrollView.contentOffset.y + self.labelHeight)
//                                self.scrollView.setContentOffset(offset, animated: false)
//                            }
//                            self.animator?.startAnimation()
//                        } else {
//                            // Remove the labels that are no longer visible
//                            self.stackView.removeArrangedSubview(firstLabel)
//                            firstLabel.removeFromSuperview()
//                        }
//                    }
//                }
//                timer.fire()
//    }
//
//    func createLabel(with text: String) -> UILabel {
//            let label = UILabel()
//            label.text = text
//            label.font = UIFont.systemFont(ofSize: 18.0)
//            label.textColor = UIColor.black
//            label.numberOfLines = 0
//            label.textAlignment = .center
//            label.translatesAutoresizingMaskIntoConstraints = false
//
//            NSLayoutConstraint.activate([
//                label.widthAnchor.constraint(equalToConstant: labelWidth),
//                label.heightAnchor.constraint(equalToConstant: labelHeight)
//            ])
//
//            return label
//        }
//
//    func updateTextBlocks(with newStrings: [String]) {
//            textBlocks = newStrings
//        }
//
//
//}
//
//


import UIKit

class DemoTest: UIViewController {
    
    var animator: UIViewPropertyAnimator?
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    
    var textBlocks = ["This is the first block of text.",
                      "This is the second block of text.",
                      "This is the third block of text.",
                      "This is the fifth block of text."
    ]
    
    var newTextBlocks: [String]?
    
    let labelHeight: CGFloat = 30.0
    let labelWidth: CGFloat = 250.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the scroll view and stack view to the view controller's view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        // Set up the constraints for the scroll view and stack view
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Set up stack view properties
        stackView.axis = .vertical
        stackView.alignment = .center
        
        // Add labels to the stack view
        loadTextBlocks()
        
        // Set up automatic scrolling
        let contentHeight = CGFloat(textBlocks.count) * labelHeight
        let scrollViewHeight = scrollView.frame.size.height
        let padding = max(100, (scrollViewHeight - contentHeight) / 2.0)
        scrollView.contentInset = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if let firstLabel = self.stackView.arrangedSubviews.first {
                let convertedMaxY = self.scrollView.convert(CGPoint(x: 0.0, y: firstLabel.frame.maxY), from: firstLabel.superview).y
                
                if convertedMaxY > 50 {
                    // Move the content up with smooth animation
                    self.animator?.stopAnimation(true)
                    self.animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
                        let offset = CGPoint(x: 0.0, y: self.scrollView.contentOffset.y + self.labelHeight)
                        self.scrollView.setContentOffset(offset, animated: false)
                    }
                    self.animator?.startAnimation()
                } else {
                    // Remove the labels that are no longer visible
                    self.stackView.removeArrangedSubview(firstLabel)
                    firstLabel.removeFromSuperview()
                }
            }
        }
        timer.fire()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let newTextBlocks = newTextBlocks {
            textBlocks = newTextBlocks
            loadTextBlocks()
        }
    }
    
    func loadTextBlocks() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for textBlock in textBlocks {
            let label = createLabel(with: textBlock)
            stackView.addArrangedSubview(label)
        }
    }
    
    func createLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                    label.widthAnchor.constraint(equalToConstant: labelWidth),
                    label.heightAnchor.constraint(equalToConstant: labelHeight)
        ])

        return label
    }
    
    func updateTextBlocks(with newTextBlocks: [String]) {
            self.newTextBlocks = newTextBlocks
        }
    
    
    
}

       
