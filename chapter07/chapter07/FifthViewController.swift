//
//  FifthViewController.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/17.
//

import Foundation
import UIKit

// AutoLayoutを用いてレイアウトを定義すると、
// 端末が回転しても同じようにレイアウトされることになる。
// 端末の方向によってレイアウトを変えたい場合は、
// 別途制約を定義する必要がある。
// ビューから対象の制約を取得することは可能だが、
// プロパティとして必要な制約への参照を持つ方が
// 計算コストが低くなる場合が多い。
final class FifthViewController: UIViewController {
   
    // portrait
    @IBOutlet private weak var detailLabelPortraitTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var detailLabelPortraitLeadingConstraint: NSLayoutConstraint!
    
    // landscape
    @IBOutlet private weak var detailLabelLandscapeTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var detailLabelLandscapeLeadingConstraint: NSLayoutConstraint!
    
    // 立て画面時の制約を持つ配列
    private var portraitConstarints: [NSLayoutConstraint]?
    // 横画面時の制約を持つ配列
    private var landscapeConstarints: [NSLayoutConstraint]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        portraitConstarints = [detailLabelPortraitTopConstraint, detailLabelPortraitLeadingConstraint]
        landscapeConstarints = [detailLabelLandscapeTopConstraint, detailLabelLandscapeLeadingConstraint]
    }
   
    // 端末の回転を検知する。
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { context in
            // 必要な制約のみを無効化する
            // 現在のビューに適用されている制約全てを無効化してはいけない。
            // 以下のようなコードを記述すると、画面が真っ白になってしまう。
            // NSLayoutConstraint.deactivate(self.view.constraints)
            // NSLayoutConstraint.deactivate(self.landscapeConstraints ?? [])
            // self.view.constraintsは画面を維持するための制約も持っているため、
            // 必要以上に制約を無効化してしまうからである。
            if size.width <= size.height {
                // 横画面制約を無効化
                NSLayoutConstraint.deactivate(self.landscapeConstarints ?? [])
                // 縦画面制約を有効化
                NSLayoutConstraint.activate(self.portraitConstarints ?? [])
            } else {
                // 縦画面制約を無効化
                NSLayoutConstraint.deactivate(self.portraitConstarints ?? [])
                // 横画面制約を有効化
                NSLayoutConstraint.activate(self.landscapeConstarints ?? [])
            }
        }
    }
}
