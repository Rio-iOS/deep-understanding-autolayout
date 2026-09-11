import UIKit

// プロジェクトファイル内で設定したStoryboardを起動するのは、
// アプリケーションデリゲートである。
// プロジェクト生成時にUIApplicationDelegateプロトコルを実装した
// AppDelegate.swiftとして自動生成される。
// Objective-Cでは、main.m内でアプリ起動時のStoryboard設定が行われる。
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // アプリケーションの起動プロセスが完了する直前のタイミングで呼ばれる。
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("✅ application(_: UIApplication, didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]?)")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        print("✅ application(_: UIApplication, configurationForConnecting: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print("✅ application(_: UIApplication, didDiscardSceneSessions: Set<UISceneSession>)")
    }


}

