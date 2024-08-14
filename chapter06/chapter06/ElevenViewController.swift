//
//  ElevenViewController.swift
//  chapter06
//
//  Created by 藤門莉生 on 2024/08/13.
//

import Foundation
import UIKit

final class ElevenViewController: UIViewController {
    @IBOutlet weak private var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension ElevenViewController {
    func setupConstraints() {
        // トルツメパターン
        // 「トルツメ」とは、不要なインタフェースを削除して、
        // そのスペースを詰めることを指す。
        // 「取って詰める」から「トルツメ」である。
        
        // トルツメ失敗パターン
        // トルツメする方法として、まず考えがちなのは以下のように
        // 親ビューから削除する方法である。
        // （例1）
        // label.removeSuperview()
        // UILabelオブジェクトのテキストだけでなく、
        // ボタンなどその他のオブジェクトも消えてしまう。
        // 親ビューからあるオブジェクトを削除すると、
        // そのオブジェクトに関連した制約が設定されている場合は、
        // その制約も取り除かれてしまう。
        
        // （例2）
        // label.isHidden = true
        // ラベルをhiddenにすると、ラベル自体は見えなくなるが、
        // intrinsic content sizeに合わせて
        // 自動的に生成された高さの制約が残っているため
        // スペースが詰まらずに空いたままになってしまう。
    }
}
