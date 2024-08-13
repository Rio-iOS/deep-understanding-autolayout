//
//  UIView+Extensions.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

extension UIView {
    /// selfと共通の祖先ビューを探すメソッド
    func commonSuperViewWith(target: UIView) -> UIView? {
        // selfを含んだ祖先ビューの配列を取得
        var hierarcy: [UIView] = []
        var current: UIView? = self
        while let view = current {
            hierarcy.append(view)
            current = view.superview
        }
        
        // 共通の祖先ビューを探す
        var currentTarget: UIView? = target
        while let candidate = currentTarget {
            if let _ = hierarcy.firstIndex(of: candidate) {
                return candidate
            }
            currentTarget = candidate.superview
        }
        
        return nil
    }
}
