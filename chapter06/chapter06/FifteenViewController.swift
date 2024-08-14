//
//  FifteenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/14.
//

import Foundation
import UIKit

final class FifteenViewController: UIViewController {
    @IBOutlet private weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension FifteenViewController {
    func setupConstraints() {
        // その他のトルツメ
        // UIViewやUIButtonなどもUILabelやUIImageViewのトルツメと同じである。
        // 縦方向にビューオブジェクトを順番にレイアウトしているのであれば、
        // トルツメしたいオブジェクトに高さとその上部の制約を与え、参照を持つ。
        // トルツメしたいタイミングで、これらの制約のconstantを0にして、
        // ビューオブジェクトをhiddenにする。
        // 子ビューが設定されているUIViewでも同様に、
        // UIViewを非表示にして、制約定数（constant）を0にするとトルツメできる。
        // 優先度の違う2つの制約を与え、トルツメ時に優先度を入れ替えることで実現も可能。
        button.isHidden = true
        
        buttonTopConstraint.constant = 0
    }
}
