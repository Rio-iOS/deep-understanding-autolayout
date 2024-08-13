//
//  ThirdViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension ThirdViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
       
        let textField = UITextField()
        textField.placeholder = "placeholder"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        // NSLayoutAnchorは、NSLayoutConstraintよりも直感的に制約を生成するために作られたファクトリークラスである。
        // このクラスはFluent Interfaceになっていて、以下のようなメリットがある。
        // - リーダブルである。自然言語のようにコードが読める
        // - メソッドチェーンすることができる。
        // Anchorとは何を指しているのか？
        // - Anchorという単語には、「船のイカリ」や「固定する」という意味がある。
        // - この場合は、オブジェクト内で固定する対象を指定し、指定した箇所に対して制約を生成する役割がある。
        // - オブジェクト内で固定する対象はAttributeという形で表され、
        // - このAttributeの性質に合わせて、NSLayoutConstraintを生成するクラスである
        // - NSLayoutAnchorを継承した以下の3種類のクラスが定義されている。
        // - NSLayoutDimension: ビューの幅と高さ制約を生成する
        // - NSLayoutXAxisAnchor: x軸方向の制約を生成する
        // - NSLayoutYAxisAnchor: y軸方向の制約を生成する
        // NSLayoutAnchorを用いた制約の生成では、NSLayoutConstraintを直接生成するのではなく、
        // UIViewからNSLayoutAnchorのサブクラスを取得し、
        // このNSLayoutAnchorのサブクラスがNSLayoutConstraintを生成する。
        // - botomAnchor -> Bottom
        // - centerXAnchor -> CenterX
        // - centerYAnchor -> CenterY
        // - firstBaselineAnchor -> FirstBaseline
        // - heightAnchor -> Height
        // - lastBaselineAnchor -> Baseline
        // - leadingAnchor -> Leading
        // - leftAnchor -> Left
        // - rightAnchor -> Right
        // - topAnchor -> Top
        // - trailingAnchor -> Trailing
        // - widthAnchor -> Width
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0).isActive = true
    }
}
