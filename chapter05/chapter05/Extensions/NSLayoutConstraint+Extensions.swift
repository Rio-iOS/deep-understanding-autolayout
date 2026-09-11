import UIKit

extension NSLayoutConstraint {
    /// 対象の共通祖先を確認して制約を有効にします。Layout Guideは所有ビューで判定します。
    /// - Returns: 有効化できた場合true。対象が未接続・未所有の場合false。
    @discardableResult
    func activateInCommonAncestor() -> Bool {
        func owningView(of item: AnyObject?) -> UIView? {
            (item as? UIView) ?? (item as? UILayoutGuide)?.owningView
        }
        guard let first = owningView(of: firstItem as AnyObject?) else { return false }
        if secondItem != nil {
            guard let second = owningView(of: secondItem as AnyObject?),
                  first.nearestCommonAncestor(with: second) != nil else { return false }
        }
        isActive = true
        return true
    }

    /// 共通祖先から上位の階層に設置された、指定ビュー同士を直接結ぶ制約を取得します。
    static func constraints(between first: UIView, and second: UIView) -> [NSLayoutConstraint] {
        var ancestor = first.nearestCommonAncestor(with: second)
        var result: [NSLayoutConstraint] = []
        while let view = ancestor {
            result += view.constraints.filter { $0.connects(first, and: second) }
            ancestor = view.superview
        }
        return result
    }

    private func connects(_ first: UIView, and second: UIView) -> Bool {
        (firstItem as? UIView === first && secondItem as? UIView === second)
            || (firstItem as? UIView === second && secondItem as? UIView === first)
    }
}
