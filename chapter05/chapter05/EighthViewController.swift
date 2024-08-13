//
//  EighthViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class EighthViewController: UIViewController {
    @IBOutlet private weak var buttonTrailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension EighthViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        // レイアウトを変更するためには、
        // 制約を削除する他に、既存の制約編集することができる。
        // それは主に制約定数を変更することで実行される。
        // 基本的には、制約を追加・削除するとレイアウトエンジンが
        // 再計算を実施するために、計算コストが高くなる。
        // 基本的にレイアウトに大きな変更がない限りは
        // 制約定数を編集することを推奨されている。
        // 制約を編集するには、UIViewのconstraintsプロパティから
        // 制約の配列を取得して目的の制約を探すか、
        // プロパティとして制約への参照を持ち続けるかどうかが基本となる。
        // Appleは後者を推奨している。
        // パフォーマンス低下を特に実行するのは、テーブルビューセル内で動的に
        // 大きくレイアウトが変更される時である。
        // もしスクロールして、新しいセルが表示されるたびに多くの制約が必要であり、
        // レイアウト実施によるパフォーマンスが気になる場合は、
        // 代わりに制約定数を編集する方法を使えないか考えてみると良い。
        buttonTrailingConstraint.constant = 32.0
    }
}
