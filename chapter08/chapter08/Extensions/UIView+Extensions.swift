//
//  UIView+Extensions.swift
//  chapter08
//
//  Created by 藤門莉生 on 2024/08/17.
//

import Foundation
import UIKit

extension UIView {
    // hasAmbiguousLayoutは、製品コードに含めることができないため、
    // #if DEBUGと#endifで囲み、デバッグ環境でのみ呼び出される。
    // #if DEBUGと#endiffというマクロが登場したが、
    // Objective-Cとは違い、Swiftではそのまま利用することができない。
    // このマクロを利用するためには、コンパイル時のオプションとして、
    // フラグを設定する必要がある。
    // プロジェクトファイルを開いて、アプリのターゲットを選択し、
    // Build Settingsを開き、[Swift Compiler - Custom Flags] > [Other Swift Flags] > [Debug]で -D DEBUGを設定する。
    func hasAmbiguity() -> Bool {
        // 戻り値の用のフラグ
        var hasAmbiguity = false
        
        #if DEBUG
        if self.hasAmbiguousLayout {
            print("✅\(self.description) : AMBIGUOUS")
            hasAmbiguity = true
        }
        
        // サブビューがあれば再帰的に調べる
        for view in self.subviews {
            if view.hasAmbiguousLayout {
                hasAmbiguity = true
            }
        }
        #endif
        
        return hasAmbiguity
    }
   
    // UIViewのexerciseAmbiguityInLayout()を用いると、
    // 曖昧な制約を持つビューオブジェクトのフレームを、制約を満たす範囲でランダムに変更する。
    // 与えた制約の効果を視覚的に確認することができる。
    // しかし、exerciseAmbiguityInLayout()を1度読んだだけでは、小さなフレームの変化しか起こらない。
    // 以下のように繰り返し実行させることができる。
    @objc func exerciseAmbiguityInLayoutRepeatedly(recursive: Bool) {
        #if DEBUG
        if self.hasAmbiguousLayout {
            // タイマーで1.0秒ごとにexerciseAmbiguityInLayout()を呼ぶように設定
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIView.exerciseAmbiguityInLayout), userInfo: nil, repeats: true)
        }
       
        // 再帰的に実行するフラグをオン
        if recursive {
            for view in subviews {
                // サブビューにおいてもこのメソッドを実行
                view.exerciseAmbiguityInLayoutRepeatedly(recursive: recursive)
            }
        }
        #endif
    }
    
    func constraintsReferringView(view: UIView) -> [NSLayoutConstraint] {
        // 現在のビューの制約達の中で
        constraints.compactMap { constraint in
            // 制約の対象が引数のビューであれば
            guard (constraint.firstItem as? UIView == view)
                    || (constraint.secondItem as? UIView == view) else {
                return nil
            }
            return constraint
        }
    }
}
