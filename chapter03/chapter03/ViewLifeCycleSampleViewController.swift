//
//  ViewLifeCycleSampleViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
//

import Foundation
import UIKit

class ViewLifeCycleSampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅do - viewDidLoad()")
        setupViews()
        showExplainAboutViewLifeCycle()
    }
   
    // ビューの制約を更新する必要がある場合、ビューコントローラに通知
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("✅do - updateViewConstraints()")
    }
}

private extension ViewLifeCycleSampleViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let customView = CustomView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
       
        customView.updateConstraintsIfNeeded()
        customView.setNeedsUpdateConstraints()
        customView.layoutIfNeeded()
        customView.setNeedsLayout()
    }
    
    func showExplainAboutViewLifeCycle() {
        print("✅ Viewオブジェクトのレイアウトライフサイクルは以下")
        print("✅ 1. 制約の更新")
        print("✅ 2. フレームの更新")
        print("✅ 3. レンダリング")
    }
}

fileprivate class CustomView: UIView {
    // updateConstraints()が呼ばれることによって、
    // 制約を満たすための再計算がレイアウトエンジンにより実施
    // 子Viewから親Viewに向かってボトムアップに制約の計算が実施される
    // 主に以下4つの場合
    // - 制約のactiveフラグによる有効化/無効化
    // - 制約の優先度変更
    // - 制約の追加や削除
    // - 制約を与えられたビューの階層変更
    // このメソッドを唯一overrideした方が良いのは、
    // 制約更新においてパフォーマンスが十分でない場合のみ
    // このメソッド内で制約を更新すると、
    // レイアウトエンジンが複数の制約変更を特定のレイアウトパス中で
    // バッチ処理できるので制約を効率よく更新可能
    override func updateConstraints() {
        super.updateConstraints()
        print("✅do - updateConstraints()")
        print("✅updateConstraints()のoverrideにより、制約の更新時に独自の処理を追加可能")
    }
    
    // 開発者が制約の更新を明示的に実行
    // 直接updateConstraints()は呼び出さない
    // frameの更新までは保証されない
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        print("✅do - updateConstraintsIfNeeded()")
    }
    
    // 制約を更新する必要があるというフラグが立つ
    // 次のレイアウトパスで制約の再計算が実行される
    // updateConstraintsIfNeeded()とは違い
    // 即座にupdateConstraints()が呼ばれるわけではない。
    // 複数の箇所で制約を更新しても同じレイアウトパスで
    // 制約が更新されるため、少しパフォーマンスが良い。
    // frameの更新までは保証されない
    override func setNeedsUpdateConstraints() {
        print("✅do - setNeedsUpdateConstraints()")
    }
   
    // レイアウト情報が更新されると、レイアウトを更新するために
    // レイアウトエンジンが計算したフレーム情報をビューが受け取り、
    // layoutSubviews()が呼ばれる。
    // 親Viewから子Viewにトップダウンにフレームの更新を実施
    // layoutSubviews()が呼ばれると、updateConstraintsIfNeeded()が呼ばれ、
    // 更新が必要であれば、制約も更新される
    // 以下の場合にlayoutSubviews()が呼ばれる
    // - ビューのフレームが更新された時（端末の回転など）
    // - SubViewが追加/削除された時
    // - UIScrollViewのサブクラスにおいて、contentOffsetが変更された時
    override func layoutSubviews() {
        super.layoutSubviews()
        print("✅do - layoutSubviews()")
    }
   
    // layoutIfNeeded()を呼ぶと、即座にフレームが更新される
    // 直後にフレーム更新後の情報を用いて何らかの処理を行う場合は、
    // layoutIfNeeded()を利用
    // それ以外は、setNeedsLayout()を利用した方が
    // 一度のレイアウトパスでレイアウトが更新される
    // setNeedsLayout()を使ったほうが良い
    // メインスレッドでレイアウトメソッド呼ぶ
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print("✅do - layoutIfNeeded()")
    }
   
    // setNeedsLayout()メソッドを呼ぶと、
    // フレームを更新する必要があるというフラグが立ち
    // 次のレイアウトパスで制約の再計算が実行される
    // メインスレッドでレイアウトメソッドを呼ぶ
    override func setNeedsLayout() {
        super.setNeedsLayout()
        print("✅do - setNeedsLayout()")
    }
}
