import Foundation
import UIKit

extension NSLayoutConstraint {
    /// 制約の対象ビューに応じて、共通の祖先または単独の対象ビューへ制約を追加します。
    ///
    /// 対象がUIViewへ変換できない場合や共通の祖先がない場合は、追加しません。
    /// レイアウトガイドを扱わない、制約の設置先を学ぶための実装です。
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
    
    /// 最も近い共通の祖先に設置された、2つのビューを直接結ぶ制約を返します。
    ///
    /// 共通の祖先がない場合は空配列を返します。さらに上位の祖先にある制約は検索しません。
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
   
    /// 2つの制約対象が、順序に関係なく指定したビューと一致するかを返します。
    func isConstraintBetween(view1: UIView, view2: UIView) -> Bool {
        if (self.firstItem as? UIView == view1 && self.secondItem as? UIView == view2)
            || (self.firstItem as? UIView == view2 && self.secondItem as? UIView == view1) {
            return true
        }
        
        return false
    }
}
