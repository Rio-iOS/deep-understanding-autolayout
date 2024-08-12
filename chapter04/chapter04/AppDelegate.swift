//
//  AppDelegate.swift
//  chapter04
//
//  Created by 藤門莉生 on 2024/08/04.
//

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
        // Override point for customization after application launch.
        print("✅ application(_: UIApplication, didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]?)")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("✅ application(_: UIApplication, configurationForConnecting: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("✅ application(_: UIApplication, didDiscardSceneSessions: Set<UISceneSession>)")
    }


}

