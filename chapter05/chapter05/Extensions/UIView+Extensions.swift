import UIKit

extension UIView {
    /// 自分自身も含め、指定したビューとの最も近い共通祖先を返します。別の階層ならnilです。
    func nearestCommonAncestor(with view: UIView) -> UIView? {
        var ancestors = Set<ObjectIdentifier>()
        var current: UIView? = self
        while let ancestor = current {
            ancestors.insert(ObjectIdentifier(ancestor))
            current = ancestor.superview
        }
        current = view
        while let candidate = current {
            if ancestors.contains(ObjectIdentifier(candidate)) { return candidate }
            current = candidate.superview
        }
        return nil
    }
}
