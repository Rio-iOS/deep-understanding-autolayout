//
//  ForthViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class ForthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension ForthViewController {
    func setupConstraints() {
        // 固定サイズパターンとの組み合わせ
        // 複数オブジェクトが並んでいる場合は、
        // 画面サイズに合わせてサイズが変化するオブジェクトと
        // 固定サイズのオブジェクトを組み合わせることで、
        // 柔軟なレイアウトを実現できる。
        // （例）
        // - 水平方向
        //   - label1.leading = icno1.trailing + 8
        //   - switch1.leading = label1.trailing + 8
        //   - switch1.leading = label1.trailing + 8
        //   - trailingMargin = switch1.trailing
        // - 垂直方向
        //   - label1.centerY = icno1.centerY
        //   - switch1.centerY = label1.centerY
        // 水平方向には、leadingを左側のオブジェクトに、
        // trailingを右側のオブジェクトに固定する制約を与えている。
        // 幅は左右のオブジェクトの位置と幅が決定すれば、
        // その位置によってラベルの幅も確定する。
        // UILabel -> Intrinsic Content Sizeを持つ。
        // UISwitch -> Intrinsic Content Sizeを持つ。
    }
}
