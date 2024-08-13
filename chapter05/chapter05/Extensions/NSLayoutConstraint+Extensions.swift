//
//  NSLayoutConstraint+Extensions.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    func activate() {
        guard let firstItem = self.firstItem as? UIView else { return }
        // 制約対象が2つの時
        if let secondItem = self.secondItem as? UIView {
            guard let commonSuperView = firstItem.commonSuperViewWith(target: secondItem) else { return }
            commonSuperView.addConstraint(self)
        }
        // 制約対象のアイテムが1つの時
        else {
            firstItem.addConstraint(self)
        }
    }
    
    /// 2つのビュー共通の制約を見つける
    func constraintsBetween(view1: UIView, view2: UIView) -> [NSLayoutConstraint] {
        guard let superView = view1.commonSuperViewWith(target: view2) else {
            return []
        }
        
        var constraints = [NSLayoutConstraint]()
        
        for constraint in superView.constraints {
            if (constraint.isConstraintBetween(view1: view1, view2: view2)) {
                constraints.append(constraint)
            }
        }
        
        return constraints
    }
   
    /// その制約があるビュー達の間を定義しているのか調べる
    func isConstraintBetween(view1: UIView, view2: UIView) -> Bool {
        if (self.firstItem as? UIView == view1 && self.secondItem as? UIView == view2)
            || (self.firstItem as? UIView == view2 && self.secondItem as? UIView == view1) {
            return true
        }
        
        return false
    }
}
