//
//  FourthViewController.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/16.
//

import Foundation
import UIKit

// キーボード表示時にレイアウトを調整する
// キーボードによって入力領域が隠れてしまうことがある。
// AutoLayoutを用いると、キーボード表示によるレイアウトの変化にも適用できる。
final class FourthViewController: UIViewController {
    // 下部の制約に対してbottomConstraintとしてカスタムクラスにて参照を持つ
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // キーボードの表示・非表示を検知する
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
}

private extension FourthViewController {
    // まず、通知のuserInfoに含まれるキーボードの高さの情報と、
    // キーボード表示アニメーションの長さを取得する
    // これらの値を用いて、スクロールビュー下部のスペースをキーボードの高さ分だけ
    // 与えるアニメーションをanimateWithDuration(_:animations:)によって実行
    // layoutIfNeed()が呼ばれることで、変更されたレイアウトパスが呼ばれるのを
    // 待つことなく即座にUIのフレームを更新している。
    @objc func keyboardWillShow(notification: Notification) {
        guard let info = notification.userInfo else {
            fatalError("Unexpected notification")
        }
        
        // キーボードの高さを取得
        guard
            let keyboardRect = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else {
            return
        }
        let keyboardHeight = keyboardRect.size.height

       
        // キーボード表示アニメーションの時間を取得
        guard let animationDuration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        
        // 取得した情報を元にスクロールビューのレイアウトを変更
        bottomConstraint.constant = keyboardHeight
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
   
    // 内容はキーボード表示と変わらない。
    // bottomConstraint.constantを0にすることで、
    // スクロールビューが画面全体に表示される制約に戻している。
    // その後、userInfoから受け取ったアニメーションの長さを用いて
    // レイアウトのアニメーションを実行
    @objc func keyboardWillHide(notification: Notification) {
        guard let info = notification.userInfo else {
            fatalError("Unexpected notification")
        }
        
        // キーボード表示アニメーションの時間を取得
        guard let animationDuration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        
        // 取得した情報を元にスクロールビューのレイアウトを変更
        bottomConstraint.constant = 0
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
}
