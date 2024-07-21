//
//  ScrollViewSampleViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
//

import Foundation
import UIKit

class ScrollViewSampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ScrollViewSampleViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8.0
        for _ in 0..<40 {
            let view = CustomView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .systemBlue
            stackView.addArrangedSubview(view)
        }
        
        scrollView.addSubview(stackView)
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        view.layoutIfNeeded()
        let contentWidth = stackView.arrangedSubviews.reduce(0) { $0 + $1.intrinsicContentSize.width + stackView.spacing }
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
    }
}

extension ScrollViewSampleViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("✅ scrollView.contentSize: \(scrollView.contentSize)")
        print("✅ scrollView.contentOffset.x: \(scrollView.contentOffset.x)")
        print("✅ scrollView.contentOffset.y: \(scrollView.contentOffset.y)")
    }
}

fileprivate class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: 200, height: 100)
    }
}

extension UIScrollView {
    open override func layoutSubviews() {
        print("✅ do - layoutSubviews()")
        print("✅ UIScrollView.contentSize: \(contentSize)")
        print("✅ UIScrollView.contentOffset.x: \(contentOffset.x)")
    }
}
