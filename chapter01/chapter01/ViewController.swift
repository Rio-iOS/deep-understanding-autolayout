//
//  ViewController.swift
//  chapter01
//
//  Created by 藤門莉生 on 2024/07/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showViewSize()
        showDeviceModel()
        showTraitCollection()
    }
}

private extension ViewController {
    func showViewSize() {
        let size = UIScreen.main.bounds.size
        let origin = UIScreen.main.bounds.origin
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        print("✅view size: \(size)")
        print("✅view origin: \(origin)")
        print("✅view width: \(width)")
        print("✅view height: \(height)")
    }
    
    func showDeviceModel() {
        let model = UIDevice.current.model
        let systemName = UIDevice.current.systemName
        let systemVersion = UIDevice.current.systemVersion
        print("✅iPhone model: \(model)")
        print("✅iPhone system name: \(systemName)")
        print("✅iPhone system version: \(systemVersion)")
    }
    
    func showTraitCollection() {
        let trait = traitCollection
        print("✅traitCollection: \(trait)")
        print("✅traitCollection.verticalSizeClass: \(trait.verticalSizeClass)")
        print("✅traitCollection.horizontalSizeClass: \(trait.horizontalSizeClass)")
    }
}
