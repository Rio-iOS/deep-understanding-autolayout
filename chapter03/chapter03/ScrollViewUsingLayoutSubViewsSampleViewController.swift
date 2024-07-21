//
//  ScrollViewUsingLayoutSubViewsSampleViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/20.
//

import Foundation
import UIKit

class ScrollViewUsingLayoutSubViewsSampleViewController: UIViewController {
    private let customViewWidth = 200
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ScrollViewUsingLayoutSubViewsSampleViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let customScrollView = CustomScrollView()
        
        view.addSubview(customScrollView)
        
        NSLayoutConstraint.activate([
            customScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        view.layoutIfNeeded()
    }
}

fileprivate class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
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

fileprivate class CustomScrollView: UIScrollView {
    private var contentXCenter: CGFloat = 0
    private let limitArrangedSubViewsCount = 3
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        showsHorizontalScrollIndicator = false
        decelerationRate = .fast
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    // layoutSubViews()をオーバーラードすることで、
    // 効率的なレイアウトを実現することができるが、
    // オーバーライドするには以下の2点を気を付ける。
    // 1. super.layoutSubviews()を呼ぶまで、フレームが更新されない。
    // layoutSubviews()内で制約を与えたオブジェクトのフレーム情報を
    // 用いた処理をする時は注意が必要
    // 2. layoutSubviews()がトップダウンに更新される点である。
    // 更新がトップダウンなので、子ビューはまだフレームの更新がされておらず、
    // 位置情報などに変更を加えることができるが、
    // 親ビューのレイアウトに変更を加えると再起的に更新を続けてしまいクラッシュ
    override func layoutSubviews() {
        super.layoutSubviews()
        print("✅ do - layoutSubviews()")
        print("✅ contentSize.width: \(contentSize.width)")
        print("✅ contentOffset.x: \(contentOffset.x)")
        contentXCenter = (contentSize.width + contentOffset.x) / 2
        print("✅ contentXCenter: \(contentXCenter)")
        
        if (contentXCenter/2) <= contentOffset.x {
            let customView = CustomView()
            stackView.addArrangedSubview(customView)
            contentSize = CGSize(width: stackView.bounds.width, height: stackView.bounds.height)
        }
        
        if (contentOffset.x <= 0) {
            while limitArrangedSubViewsCount < stackView.arrangedSubviews.count {
                print("✅stackView.arrangedSubViews.count: \(stackView.arrangedSubviews.count)")
                guard let lastView = stackView.arrangedSubviews.last else { return }
                print("✅remove arrangedSubViews")
                stackView.removeArrangedSubview(lastView)
                lastView.removeFromSuperview()
            }
            contentSize = CGSize(width: stackView.bounds.width, height: stackView.bounds.height)
        }
    }
}

private extension CustomScrollView {
    func setupViews() {
        contentXCenter = (contentSize.width + contentOffset.x) / 2
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8.0
        stackView.axis = .horizontal
        
        for _ in 0..<3 {
            let customView = CustomView()
            stackView.addArrangedSubview(customView)
        }
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: stackView.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        contentSize = CGSize(width: stackView.bounds.width, height: stackView.bounds.height)
    }
}
