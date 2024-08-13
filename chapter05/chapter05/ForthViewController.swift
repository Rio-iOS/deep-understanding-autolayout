//
//  ForthViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class ForthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension ForthViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
        
        // コードで制約を追加したあと、その制約をレイアウトに対して有効にする必要がある。
        // この方法はサポートするOSによって異なる。
        // iOS7以前は対象となるビューに対して制約を追加する。
        // iOS8.0以降をサポートするのであれば、制約を有効化する。
        // どのOSをサポートする場合も、FirstItemとSecondItemから最も近い共通の祖先ビューが制約を保持する。
        // 制約は共通の祖先ビューに追加されることによってレイアウトに影響を与えることができる。
        // iOS8.0以降のOSで制約を追加するには、NSLayoutConstraintのactiveプロパティをtrueにする。
        // 制約自体は有効化されると、自動的に対象となるオブジェクトの共通祖先ビューに対して追加される。
    }
}
