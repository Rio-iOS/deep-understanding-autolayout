//
//  ViewController.swift
//  chapter03
//
//  Created by 藤門莉生 on 2024/07/19.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅viewDidLoad()")
        showView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("✅viewWillApper(_: Bool)")
        showView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("✅viewDidApper(_: Bool)")
        showView()
    }
}

private extension ViewController {
    func showView() {
        print("✅view: \(String(describing: view))")
        print("✅ViewController: \(self)")
        print("✅window: \(String(describing: view.window))")
        print("✅window.rootViewController: \(String(describing: view.window?.rootViewController))")
        print("✅windowScene: \(String(describing: view.window?.windowScene))")
        print("✅windowScene.Screen: \(String(describing: view.window?.windowScene?.screen))")
        print("✅window.Screen: \(String(describing: view.window?.screen))")
        print()
    }
}
