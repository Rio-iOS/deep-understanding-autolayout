//
//  SceneDelegate.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // UIWindowは、ビューを管理し、ディスプレイに表示するウィンドウの役割を担う。
        // UIWindowは、タッチイベント、フォーカス、座標変換に関して特別な機能が
        // 追加されたUIViewのサブクラスである。
        // キーウィンドウとなることで、これらの入力を受け付けることができる。
        // UIWindowは1つのアプリ上で複数表示ができる。
        // 開発者が明示的にウィンドウを生成していなくても、
        // 新しいウィンドウが生成して必要なビューコンポーネントを生成する。
        let window = UIWindow(windowScene: windowScene)
        // window.isKeyWindow == false
        print("✅window.isKeyWindow: \(window.isKeyWindow)")
        
        let topVC = TopViewController()
        topVC.view.backgroundColor = .systemBackground
        let rootViewController = UINavigationController(rootViewController: topVC)
        window.rootViewController = rootViewController
        
        // window.isKeyWindow == true
        window.makeKeyAndVisible()
        print("✅window.isKeyWindow: \(window.isKeyWindow)")
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

