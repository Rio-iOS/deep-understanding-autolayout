//
//  FirstViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension FirstViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        // AutoLayoutの基本は制約である。
        // その制約を与えるNSLayoutConstraintを
        // コード上で生成する方法は以下の3つである。
        // - init(item:,attribute:, relatedBy:,toItem:,attribute:,multiplier,constraint:)
        //   - 最も一般的に用いられる方法
        // - constraintWithVisualFormat(_:,options:,metrics:,views:)で Visual Format Language（VFL）を用いる方法
        //   - Visual Format Language（VFL）は、H:[button] - [textField]といったASCIIアートのような記法を用いてレイアウトを定義できる言語
        //   - 文字列のみで複数の制約を同時に生成できる。
        //   - 非常にパワフルな記法である反面、レイアウト内容自体は静的解析されないので利用には注意が必要
        //   - Debug中のエラーメッセージには、このVFLが登場するため、記法だけでも知っておくのが良い
        // - NSLayoutAnchorファクトリークラスを用いる方法（iOS9.0〜）
        //   - NSLayoutAnchorは、NSLayoutConstraintのファクトリークラスで、冗長な初期化メソッドを直感的に読みやすくしたもの
        //   - 生成される制約は上記の2つの方法と変わらないものの、人間が理解しやすい形式で表現されるためレイアウトのミスを防ぎやすい。
       
        let textField = UITextField()
        textField.placeholder = "placeholder"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
       
        // 制約を定義する上で、必ずしも2つのAttributeへの参照が必要なわけではない。
        // ビューのサイズを決める場合は、1つのAttributeへの参照で制約が完結するため
        // Second Attributeはnilになり、AttributeはSecond Itemに合わせて
        // NSLayoutAttributeNotAnAttributeを指定する。
        // このイニシャライザは広く使われているが、
        // コードを読むだけでは、指定した制約から生成されるレイアウトを理解しにくいのが難点である。
        // この問題を解決するために多くのライブラリが開発されている。
        let constraint1 = NSLayoutConstraint(
            item: textField,
            attribute: .top,
            relatedBy: .equal,
            toItem: view.safeAreaLayoutGuide,
            attribute: .top,
            multiplier: 1.0,
            constant: 16.0
        )
        constraint1.isActive = true
        
        let constraint2 = NSLayoutConstraint(
            item: textField,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1.0,
            constant: 8.0
        )
        constraint2.isActive = true
        
        let constraint3 = NSLayoutConstraint(
            item: textField,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -8.0
        )
        constraint3.isActive = true
        
        let constraint4 = NSLayoutConstraint(
            item: textField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 40.0
        )
        constraint4.isActive = true
    }
}
