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
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

