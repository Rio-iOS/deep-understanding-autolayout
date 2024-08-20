//
//  ThirdViewController.swift
//  chapter08
//
//  Created by 藤門莉生 on 2024/08/18.
//

import Foundation
import UIKit

final class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension ThirdViewController {
    func setupConstraints() {
        // 曖昧ではない制約が与えられた時に、
        // 与えられた制約を同時に満たすことができないこと
        // 制約がコンフリクトしているという。
        // 複雑なレイアウトを実施している時に実際によく発生する問題である。
        // このコンフリクトした制約をデバッグするためには、
        // コンソールログが役に立つ。
        // UIViewAlertForUnsatisfiableConstraintsという
        // エラーになり、以下のようなエラーが表示される。
        // このログでは、以下を開発者に勧めている。
        // （1）制約の一覧を見て想定していない制約を見つけること
        // （2）必要としない制約をコード上から見つけて直すこと
        // その次に示されているのはコンフリクトしている制約の一覧である。
        // それぞれの制約は、<クラス名: メモリアドレス VFL風のレイアウト概要>のように示されている。
        /*
         Unable to simultaneously satisfy constraints.
             Probably at least one of the constraints in the following list is one you don't want.
             Try this:
                 (1) look at each constraint and try to figure out which you don't expect;
                 (2) find the code that added the unwanted constraint or constraints and fix it.
         (
             "<NSLayoutConstraint:0x6000021380a0 UIButton:0x103e2d210.leading == UILayoutGuide:0x600003b215e0'UIViewSafeAreaLayoutGuide'.leading + 50   (active)>",
             "<NSLayoutConstraint:0x600002138230 UIButton:0x103e2d210.leading == UILayoutGuide:0x600003b215e0'UIViewSafeAreaLayoutGuide'.leading + 100   (active)>"
         )

         Will attempt to recover by breaking constraint
         <NSLayoutConstraint:0x600002138230 UIButton:0x103e2d210.leading == UILayoutGuide:0x600003b215e0'UIViewSafeAreaLayoutGuide'.leading + 100   (active)>

         Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
         The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.
         */
        
        // 制約のコンフリクトによるエラーは、UIViewAlertForUnsatisfiableConstraintsの
        // シンボリックリンクブレイクポイントによって捉えることができるため、
        // ビューのデバッグ時にこのシンボリックリンクブレイクポイントを設定すると便利である。
        // Xcode上の左側に表示されるBreadpoint Navigatorを開き、
        // 画面下部の[+]ボタンから[Add Symbolic Breakpoint...]を選択する
        // シンボリックブレイクポイントが追加されるので、
        // SymbolにUIViewAlertForUnsatisfiableConstraintsを設定し、
        // Actionには、Debugger Commandとして以下を入力する。
        // expr -l objc++ -O -- [[UIWindow keyWindow] _autolayoutTrace]
        // 上記はObjective-Cで[[UIWindow keyWindow] _autolayoutTrace]の実行結果を
        // コンソールに出力するというコマンドである。
        // UIViewAlertForUnsatisfiableConstraintsに関するエラーを捉えた時に
        // このコマンドが実行されるようになり、ビューの階層を正確に知ることができる。
    }
}
