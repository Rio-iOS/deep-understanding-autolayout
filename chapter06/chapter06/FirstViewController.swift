//
//  FirstViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension FirstViewController {
    func setupConstraints() {
        // あるビューオブジェクトに対してレイアウトを確定するには、
        // 1方向につき2つの制約が必要である。
        // 垂直方向に2つと水平方向に2つ、合計4つの制約が必要となる。
        // Intrinsic Content Sizeを持つオブジェクトであれば、
        // その大きさに合わせてサイズの制約としてNSContentSizeLayoutConstrantが
        // 自動的に付与される。
        // そのため、水平方向と垂直方向それぞれについて、他のオブジェクトとの位置関係の
        // 制約を１箇所定めるだけで良くなる。
    }
}
