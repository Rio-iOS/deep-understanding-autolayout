//
//  ViewControllerLifeCycleSampleViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/21.
//

import Foundation
import UIKit

class ViewControllerLifeCycleSampleViewController: UIViewController {
    private var dogManager: DogManager?
    private var pageCount: Int?
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "テキストを入力"
        let layer = CALayer()
        layer.cornerRadius = 10
        textField.layer.addSublayer(layer)
        return textField
    }()
    // ビューの読み込み
    // ビューをメモリへ読み込み、対象のポインタとの関連付けを行うメソッド
    // super.loadView()を読んだタイミングで、UIViewControllerの
    // viewプロパティにビューがセットされる。
    // Storyboardが存在するときは、Storyboard上で定義されたビューが
    // 生成され、viewプロパティに代入される。
    // ビューの読み込み時に特別な操作を必要としない場合は、
    // 特にオーバーライドする必要はない。
    // Storyboardを用いずにカスタムビューを定義する場合は、
    // loadView()をオーバーライドし、レイアウトを定義することができる。
    // Storyboardを用いた時は親クラスが自動的にビューを生成していたが、
    // この場合は開発者がビューを生成し、viewプロパティに代入する必要がある。
    // この時、super.loadView()を呼んでしまうと、
    // self.viewにビューが生成されてしまうので、Storyboardを用いない場合は、
    // super.loadView()を呼ばない方がメモリ効率が良くなる
    override func loadView() {
        // super.loadView()
        print("✅ do - loadView()")
        //  ビューの生成
        let contentView = CustomView(frame: UIWindow().bounds)
        contentView.backgroundColor = .systemBackground
        // ビューをViewControllerに代入
        view = contentView
        
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        view.addSubview(nameLabel)
        view.addSubview(textField)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 40).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor, constant: 40).isActive = true
    }
   
    // loadView()が完了した時に呼ばれるメソッドで、
    // オーバーライドして用いる。
    // 通常このメソッドで、loadView()で読み込みが完了したUIオブジェクトに
    // プロパティをセットしたり追加の処理を実行したりする。
    // このメソッドはビューの読み込みが完了したタイミングで一度だけ呼ばれるため
    // クラス内で用いる値やオブジェクトを初期化する処理の記述に適している。
    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅ do - viewDidLoad()")
        
        dogManager = DogManager(name: "dog")
        pageCount = 0
        
        showScreenSize()
        showScreenSizeUsingWindow()
        showScreenSizeUsingWindowScene()
    }
 
    // レイアウト
    // ビューのレイアウトが開始される時に呼ばれるメソッドで、
    // この時に実行したい処理がある場合は、オーバーライドして用いる。
    // このメソッドは、以下のような場合に呼ばれる。
    // - ビューコントローラが読み込まれた後
    // - 端末の回転やビューの再表示などによってビューが新しい大きさに変わった時
    // この時点では、サブビューのレイアウトは決定されていないが、
    // 画面の向きは決定している。
    // あまり推奨はされないが、AutoLayout使用時に、
    // 画面の状態によって制約に変更を与えたい場合は、
    // 回転時に呼びだれるデリゲートメソッドではなく、
    // このメソッド内で変更を実施することもある。
    // viewWillLayoutSubviews()が呼ばれた後、
    // ビューコントローラーのupdateViewConstraints()が
    // 呼び出され、関連するビューのupdateConstraints()を
    // 呼び出すことで、ビューコントローラーのビューと、
    // その子ビュー達の制約情報が更新される。
    // 制約更新後、関連するビューにてlayoutSubviews()が
    // トップダウンに呼び出され、レイアウトが更新される。
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("✅ do - viewWillLayoutSubviews()")
    }
   
    // ビューのレイアウトが完了した時に呼ばれるメソッドで、
    // この時に実行したい処理がある場合に、オーバーライドして用いる。
    // UIViewのレイアウトサイクルにおける、layoutSubviews()による
    // フレームの更新が既に実施されているため、
    // この時点では、ビューコントローラの持つビュー内のレイアウトが確定する。
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("✅ do - viewDidLayoutSubviews()")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("✅ do - updateViewConstraints()")
    }
 
    // ビューの表示
    // ビューが表示される直前に呼ばれるメソッドで、オーバーライドして用いる。
    // このメソッドは表示される直前であればいつでも呼ばれるため、
    // メモリ上に存在する既に表示したビューが再度表示される際にも同様の挙動をする。
    // （例）
    // - バックグラウンドからアプリを開き直した場合
    // - UITabBarControllerにおけるタブの切り替え
    // 表示のたびに呼ばれるので、動的な値のセットに向いている。
    // この段階では、ユーザにUIは提供されていないため、
    // 計算コストが高い処理は避けた方が良い。
    // このメソッドが呼ばれた時には、既にViewControllerにおける
    // self.viewのフレームが決定されているが、
    // サブビューのレイアウトは決定していない。
    // また、端末の向きも確定していない。
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("✅ do - viewWillAppear(_: Bool)")
        // 動的な値のセット
        nameLabel.text = dogManager?.name
    }
  
    // ビューが表示された直後に呼ばれるメソッドで、オーバーライドして用いる。
    // UIViewのレイアウトサイクルの最後のステップであるレンダリングが終わった
    // タイミングに当たる。
    // 表示開始のメソッドviewWillAppear()と対になているため、
    // バックグラウンドから復帰した時や、UITabBarControllerにおける
    // タブの切り替え時などにもこのメソッドは呼ばれる。
    // 既にUIがユーザーに提供されてるため、ユーザ体験に直接影響を
    // 与えない処理を実行することが多い。
    // 表示の度に呼ばれる。
    // （例）
    // - ログの送信処理
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("✅ do - viewDidAppear(_: Bool)")
    }
    
    // ビューの非表示
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("✅ do - viewWillDisappear(_: Bool)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("✅ do - viewDidDisappear(_: Bool)")
    }
}

private extension ViewControllerLifeCycleSampleViewController {
    func showScreenSize() {
        // 画面サイズを取得する際には、UIScreenから取得する方法が
        // よく用いられていた。
        let screenSize = UIScreen.main.bounds
        print("✅screenSize: \(screenSize)")
        
        
    }
    
    func showScreenSizeUsingWindow() {
        // マルチタスク機能が搭載されたので、
        // スクリーンサイズとウィンドウサイズが異なる場合が出てきた。
        // そのため、以下のようにウィンドウから画面サイズを取得する方が
        // より正確に値を取得できる。
        let screenSize = UIApplication.shared.keyWindow?.bounds
        print("✅showScreenSizeUsingWindow: \(String(describing: screenSize))")
    }
    
    func showScreenSizeUsingWindowScene() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let screenSize = scene?.screen.bounds
        print("✅showScreenSizeUsingWindowScene: \(String(describing: screenSize))")
    }
}

fileprivate class DogManager {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

fileprivate class CustomView: UIView {
    override func updateConstraints() {
        super.updateConstraints()
        print("✅ do - updateConstraints()")
    }
}
