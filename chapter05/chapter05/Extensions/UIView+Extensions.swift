import Foundation
import UIKit

extension UIView {
    /// 自分自身を含め、`target`から最も近い共通の祖先ビューを返します。
    ///
    /// - Parameter target: 共通の祖先を探す相手のビュー。
    /// - Returns: 共通の祖先。異なるビュー階層に属する場合は`nil`。
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
