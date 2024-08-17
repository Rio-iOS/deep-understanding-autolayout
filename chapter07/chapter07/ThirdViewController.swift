//
//  ThirdViewController.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/16.
//

import Foundation
import UIKit

// Dynamic Typeに対応する
// Dynamic Typeとは、ユーザの設定に合わせてアプリ上のフォントサイズを変更できる機能である。
// iOS7で追加された機能で、設定アプリの[一般] > [アクセシビリティ] > [さらに大きな文字] から変更可能
// 動的なセルはUILabelオブジェクトの高さにIntrinsic Content Sizeを採用しており、
// フォントの大きさとコンテンツに合わせてレイアウトが動的に変更されるため、
// Dynamic Typeに対応する準備が整っている。
// Dynamic Typeに対応するためには、
// テキストスタイルの指定と、Dynamic Type設定画面での変更内容通知を受け取る必要がある。
// 1. フォントサイズを指定するのではなく、テキストスタイルを指定する必要がある。
// Dynamic Typeに対応しないUILabelオブジェクトをそのまま使っている場合は、
// IBのAttribute InspectorのFontにてフォントサイズを指定していたか、
// コードでは以下のように記述していたが、
// let font = UIFont.systemFontOfSize(15.0)
// 以下のテキストスタイルに設定
// let font = UIFont.preferredFont(forTextStyle:)を指定する
// 次にユーザによるDynamic Type設定変更の通知を受け取り、レイアウトに適用する。
// Dynamic Typeの設定が変更されても、アプリ内でビューを再描画しない限りは、
// ラベルのフォントサイズは変更されない。
// そんため、ユーザコンテンツサイズを変更した時に送られる
// UIContentSizeCategory.didChangeNotificationの通知を受け取り、
// テーブルビューを再読み込みすることで新しいレイアウトが適用される
final class ThirdViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var people: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = Person.generateCellData()
        setupTableView()
        // 通知の受け取りを登録
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didChangePreferredContentSize),
            name: UIContentSizeCategory.didChangeNotification,
            object: nil
        )
    }
}

private extension ThirdViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: ThirdViewCell.nibName, bundle: nil), forCellReuseIdentifier: ThirdViewCell.reuseIdentifier)
    }
}

private extension ThirdViewController {
    @objc func didChangePreferredContentSize() {
        tableView.reloadData()
    }
}

extension ThirdViewController: UITableViewDelegate {
}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let people else {
            return 0
        }
        
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdViewCell.reuseIdentifier, for: indexPath) as? ThirdViewCell else {
            fatalError("ThirdViewCell identifier is invalid")
        }
        
        guard let people else {
            return UITableViewCell()
        }
        
        cell.layoutWithData(data: people[indexPath.row])
        
        return cell
    }
}
