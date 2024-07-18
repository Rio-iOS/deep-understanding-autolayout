//
//  NSConstraintSampleViewController.swift
//  chapter02
//
//  Created by 藤門莉生 on 2024/07/18.
//

import Foundation
import UIKit

final class NSConstraintSampleViewController: UIViewController {
    private let purpleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraint()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showFrame()
        showBounds()
    }
}

private extension NSConstraintSampleViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        purpleButton.setTitle("Button", for: .normal)
        purpleButton.setTitleColor(.white, for: .normal)
        purpleButton.backgroundColor = .systemPurple
        purpleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(purpleButton)
        
        // frame ractangleに適用
        purpleButton.layer.shadowColor = UIColor.gray.cgColor
        purpleButton.layer.shadowOffset = .init(width: 1.0, height: 1.0)
        purpleButton.layer.shadowOpacity = 1.0
    }
    
    func showFrame() {
        let frame = purpleButton.layer.frame
        // NOTE: 自身を起点
        print("✅frame: \(frame)")
    }
    
    func showBounds() {
        let bounds = purpleButton.layer.bounds
        // NOTE: 原点を起点
        print("✅bounds: \(bounds)")
    }
    
    func setupConstraint() {
        // NOTE: width, heightを指定する場合などは、firstItemで完結
        // 従って、secondItemはnil
        // firstItem.attribute = a * secondItem.attribute + b
        // firstItemとsecondItemが入れ替わると、数値bの正負も入れ替わる
        let topConstraint = NSLayoutConstraint(
            item: purpleButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: view.safeAreaLayoutGuide,
            attribute: .top,
            multiplier: 1.0,
            constant: 130
        )
        
        let leadingConstraint = NSLayoutConstraint(
            item: purpleButton,
            attribute: .left,
            relatedBy: .equal,
            toItem: view,
            attribute: .left,
            multiplier: 1.0,
            constant: 50.0
        )
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
    }
}
