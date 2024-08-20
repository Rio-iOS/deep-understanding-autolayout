//
//  FirstViewController.swift
//  chapter08
//
//  Created by 藤門莉生 on 2024/08/17.
//

import Foundation
import UIKit

final class FirstViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
}

private extension FirstViewController {
    func setupConstraints() {
        // 制約によるレイアウト定義では、
        // 大きく分けて2つの理由でレイアウト崩れが発生する。
        // - 曖昧なレイアウト（Ambiguous Layout）
        //   - レイアウトが曖昧な状態とは、十分な制約が与えられず、レイアウトを確定することができない状態
        // - 制約のコンフリクト（Confilict）
        //   - これは与えられた複数の制約を同時に満たすことができない状態を指す。
        // 制約のデバッグを用いる情報を取得する方法は大きく分けて3通りある。
        // - Xcode上のIBキャンパス及びDocument Outlet Controlに表示される情報である。
        // - Xcode上で「Command + 4」を押すと画面に表示されるIssue Navigator におけるコンパイラの情報
        // - 実行時のコンソール情報
        
        
        // 曖昧なレイアウトをデバッグする
        // 十分な制約を与えられていないレイアウトは曖昧なレイアウト（Ambiguous Layout）と呼ばれ、
        // レイアウトのフレームを決定することができない。
        // レイアウトが曖昧だと、開発者が意図した通りのレイアウトにならない可能性がある。
        // レイアウトが曖昧な状態のアプリを世に出すのは避ける。
        // レイアウトが曖昧であるかどうかは、hasAmbiguousLayoutで調べることができる。
        // このメソッドはオブジェクト自身に対するレイアウトが曖昧な場合にtrueを返し、
        // 曖昧でない場合は、falseになる。
        // このメソッドを読んだオブジェクト自体が曖昧なレイアウトを持つかどうかを返すので、
        // 子ビューや親ビューのレイアウトが曖昧であるかどうかは関係しない。
        print("✅ view.hasAmbiguousLayout: \(view.hasAmbiguousLayout)")
        print("✅ label.hasAmbiguousLayout: \(label.hasAmbiguousLayout)")
        print("✅ view.hasAmbiguity(): \(view.hasAmbiguity())")
        
        view.exerciseAmbiguityInLayoutRepeatedly(recursive: true)
    }
}
