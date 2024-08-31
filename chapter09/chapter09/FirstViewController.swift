//
//  FirstViewController.swift
//  chapter09
//
//  Created by 藤門莉生 on 2024/08/26.
//

import Foundation
import UIKit

final class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    override var traitCollection: UITraitCollection {
        if self.isIphone6Plus {
            let compactWidthTrait = UITraitCollection(horizontalSizeClass: .compact)
            // traitCollectionを合成
            let overrideTraitCollection = UITraitCollection(traitsFrom: [super.traitCollection, compactWidthTrait])
            return overrideTraitCollection
        } else {
            return super.traitCollection
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        coordinator.animate { context in
            if size.width <= size.height {
                // 縦画面レイアウト用にアニメーションさせたい処理
            } else {
                // 横画面レイアウト用にアニメーションさせたい処理
            }
        }
    }
    
}

private extension FirstViewController {
    func setupConstraints() {
        // Appleは、画面サイズが多様化したiOS8では、Adaptiveという概念を紹介し、
        // それと同時にトレイトコレクション（UITraitCollection）をiOSに導入した。
        // トレイトコレクションは画面サイズを定義するサイズクラスや
        // 解像度、端末の種別に関する情報を持っているため
        // 画面サイズによって表示コンテンツを変えるような、
        // AutoLayoutのみでは対応仕切れない問題に対応することができる。
        // また、トレイトコレクションは、具体的な端末名や画面サイズではなくても、
        // 抽象的な値を持つため、どのような端末にも柔軟に対応できる。
        // トレイトコレクションは、UITraitEnvironment プロトコルに従っている
        // クラスで使用できる。
        // トレイトコレクションはスクリーンで定義され、ウィンドウ、ビューコントローラ、
        // そしてビューに渡されていく。
        // このトレイトコレクションは、ミュータブルなので、それぞれのビューに最適な値を持つ。
        
        // UITraitCollectionを取得する
        // このトレイトコレクションは、2つの方法で取得できる。
        // 1つ目は、UITraitEnvironmentプロトコルに従ったクラスからtraitCollectionプロパティで取得する。
        // 2つ目は、以下の初期化メソッドを用いる方法である。
        // 画面解像度を指定したトレイトコレクションを初期化する
        let displayScale = UITraitCollection(displayScale:.zero)
        // 端末種別を指定したトレイトコレクションを初期化する
        let userInterfaceIdiom = UITraitCollection(userInterfaceIdiom: .phone)
        // 水平方向のサイズクラスを指定したトレイトコレクションを初期化する
        let horizontalSizeClass = UITraitCollection(horizontalSizeClass: .regular)
        // 垂直方向のサイズクラスを指定したトレイトコレクションを初期化する
        let verticalSizeClass = UITraitCollection(verticalSizeClass: .regular)
        // 3Dタッチが利用可能かどうかのフラグを指定したトレイトコレクションを初期化する
        let forceTouchCapability = UITraitCollection(forceTouchCapability: .available)
        // 複数のトレイトコレクションを合成して新しいトレイトコレクションを初期化する
        let traitsFromCollections = UITraitCollection(traitsFrom: [])
        
        // 上記の初期化メソッドは、2種類に分けることができる。
        // どれか1つのトレイトの値を指定して初期化するものと、
        // すでに所有している複数のトレイトコレクション達を用いて初期化するものである。
        // トレイトの値を1つ指定して初期化する方法は、次に指定するプロパティのうち1つを指定した
        // トレイトコレクションを生成することができる。
        // 複数のトレイトコレクションを用いる方法は、
        // トレイトコレクションを合成して新たなトレイトコレクションを
        // 作りたい場合などに用いられる。
        
        // UITraitCollectionのプロパティ
        // プロパティ｜型｜役割
        // displayScale | CGFloat | 画面解像度
        // horizontalSizeClass | UIUserInterfaceSizeClass | 水平方向のサイズクラス
        // verticalSizeClass | UIUserInterfaceSizeClass | 垂直方向のサイズクラス
        // userInterfaceIdiom | UIUserInterfaceIdiom | 端末種別
        // forceTouchCapability | UIForceTouchCapability | 3Dタッチが利用可能かどうか
        
        // dispalayScale - 表示スケール
        // displayScaleは画面解像度
        // 非Retina端末であれば値は、1.0
        // Retina端末であれば値は、2.0
        // 何も指定しない場合は、0.0
        
        // horizontalSizeClass、verticalSizeClass - サイズクラス
        // horizontalSizeClass、verticalSizeClassは、表示領域の大きさを表すサイズクラス
        // サイズクラスは画面サイズをポイントやピクセルで管理する代わりに抽象的な値で表す。
        // caseは以下
        // - Unspecified
        // - Compact
        // - Regular
        
        // userInterfaceIdiom - 端末種別
        // caseは以下
        // - Unspecified
        // - Phone
        // - Pad
        // - TV
        
        // forceTouchCapability - 3Dタッチフラグ
        // forceTouchCapabilityは、3Dタッチが利用可能かどうかを示す。
        // 3Dタッチが対応でない場合は、Unavailable
        // 3Dタッチ対応場合は、Available
        // 不明な場合は、Unknown
        
        // 端末｜向き｜高さ｜幅
        // iPad | 縦向き | Regular | Regular
        // iPad | 横向き | Regular | Regular
        // iPhone 6(s) Plus | 縦向き | Regular | Compact
        // iPhone 6(s) Plus | 横向き | Compact | Regular
        // iPhone | 縦向き | Regular | Compact
        // iPhone | 横向き | Compact | Compact
        
        // この定義は端末の画面（スクリーン）に対する定義である。
        // iPad上でスプリットビューで表示される時は、
        // スクリーン幅自体はRegularでも、ウィンドウ幅がCompactになることがある。
        // ウィンドウが実際の表示領域であり、スクリーンはあくまで最大の表示領域でしかない。
        // そのため、アプリ内で画面サイズを取得する必要があるときは、
        // UIScreen.main.boundsではなく、UIWindow().boundsによって取得する方が良い
        
        // UITraitCollectionを比較する
        // .containsTraits(in:)を利用する。
        let regularWidthTrait = UITraitCollection(horizontalSizeClass: .compact)
        print("✅ \(regularWidthTrait.containsTraits(in: UITraitCollection(horizontalSizeClass: .compact)))")
        
        // UITraitCollectionを合成する
        // init(traitsFromCollections:)メソッドを用いると、
        // トレイトコレクションの配列を合成したトレイトコレクションを生成することができる。
        // このメソッドはトレイトコレクションの配列を引数として受け取り、
        // 配列の後ろのオブジェクトで値を上書きしていく。
        
        print("✅ \(self.traitCollection.containsTraits(in: .init(horizontalSizeClass: .regular)))")
 
       
        // 端末の回転挙動を扱う
        // iOS8でトレイトコレクションが登場してから画面の回転挙動の扱いも変化。
        // iOS7以前では、ビューコントローラで呼ばれる
        // willRotateToInterfaceOrientation(_:, duration:)と
        // didRotateFromInterfaceOrientation(_:)を
        // オーバーライドし、それぞれ回転挙動の直前と直後の処理を記述していた。
        // また、回転時のアニメーションを上書きするためには、
        // メソッド名から分かるように、これらのメソッドは回転挙動を捉えるためだけに使われていた。
        // iOS8でトレイトコレクションが登場したことにより、
        // 回転挙動も画面サイズの変化の1つだと捉えられるようになり、
        // UITraitEnvironmentプロトコルとUIContentContainerプロトコルで
        // 定義された画面情報変更時に呼び出されるメソッド達が代わりに用いられるようになった。
        
        // 端末回転のステップ
        // 端末の回転挙動は以下のように複数ステップに分けることができる。
        // 1. 変更を実行する前のセットアップ
        // 2. 変更を適用するアニメーションの作成
        // 3. ユーザに提供されるアニメーションの実行
        // 4. クリーンアップ
        // 最初のセットアップ時にUITraitEnvironmentプロトコルと
        // UIContentContainerプロトコルで定義されたメソッド達が呼び出され、
        // これらのメソッド内で回転挙動を扱うことができる。
        
        // トレイトコレクションが変化する直前
        // まず、willTransition(to:, with:)が呼ばれる。
        // 端末回転時には、サイズクラスが変化することで呼ばれる。
        // このメソッドはトレイトコレクションが変更される前に呼び出される。
        // iPad、iPhoneどちらの場合も、画面に変化があったにも関わらず、
        // このメソッドが呼ばれない場合がある。
        // iPadでは、縦横どちらもサイズクラスが、.regularであるため、
        // スプリットビューを用いている場合を除いて、
        // iPadが回転する時にこのメソッドが呼ばれることはない。
        // また、iPadにてスプリットビューのサイズが変更した時にも
        // トレイトコレクションが変わらない場合があるため、
        // その時にも呼ばれない。
        // そのほかに、iPhoneの端末においても端末を180度回転させる時には
        // このメソッドは呼ばれない。
        // トレイトコレクションはボトムアップに変更されていくので、
        // トレイトコレクションの変更を子ビューコントローラ達に反映するために、
        // このメソッドをオーバーライドする場合は、superを呼ぶ必要がある。
        
        // 大きさが変化する直前
        // viewWillTransition(to:, with:)が呼ばれる。
        // これは、アプリを表示しているウィンドウの大きさが変わる時に呼ばれる。
        // このメソッドは、トレイトコレクションの変更に関係せず、
        // 表示画面サイズが変更される時に呼び出されるため、
        // iPadであっても、端末が180度回転したとしても呼び出される。
        // このメソッドも、オーバーライドする際に子ビューコントローラ達に
        // サイズを伝える必要があるので、superを必ずこのメソッド内で呼ぶ必要がある。
        
        // トレイトコレクションが変化した直後
        // 最後に呼ばれるのが、traitCollectionDidChange(_:)
        // このメソッドはトレイトコレクションが変更された後に呼び出される。
        // トレイトコレクションがセットされた時にも呼び出されるため、
        // アプリ起動時や、ビューコントローラが初めてロードされたタイミングでも呼び出される。
        // このメソッドはオーバーライドした時にも、
        // レイアウト変更が他のビューにも適用されるようにsuperを呼ぶ必要がある。
        
        // これら3つのメソッド内で端末回転時の処理を実行することができる。
        // しかし、セットアッププロセスに与えられた時間枠の長さは限られているため
        // 回転時に同期通信でデータを取得したり、重たいデータベース処理をすることはできず、
        // レイアウト変更も計算コストを低くする必要がある。
        // これらの画面の変更に関するどのメソッド達が呼ばれるかは端末や機能によって
        // 異なるため、これらの処理をどこに書くかは慎重に考える必要がある。
        // 基本的には、サイズクラスが変更された時の挙動をviewWillTransition(to:, with:)に記述する。
        

        // 端末回転時のアニメーション
        // 回転時にレイアウトを変更するだけであれば、上記のどのメソッドを呼んでも問題ない。
        // ただし、画面回転時のアニメーションと同期してオブジェクト達を動かすためには、
        // willTransition(to:, with:)かviewWillTransition(to:, with:)を
        // オーバーライドする必要がある。
        // このメソッドで渡される UIViewControllerTransitionCoordinator プロトコルに従った
        // コーディネーターオブジェクトを用いると、回転時のアニメーションと同期して動く
        // 独自のアニメーションを定義することもできる。
        // 以下のようにanimateAlongsideTransition(_:,completion:)メソッドを呼び、
        // その中でアニメーションを定義する。
    }
    
    var isIphone6Plus: Bool { true }
}
