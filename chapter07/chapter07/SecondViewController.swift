//
//  SecondViewController.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/16.
//

import Foundation
import UIKit

final class SecondViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var people: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = Person.generateCellData()
        setupTableView()
    }
}

private extension SecondViewController {
    func setupTableView() {
        // Self-Sizing Cells（iOS 8.0）
        // iOS 8.0からSelf-Sizing Cellsという機能が追加された。
        // iOS7以前では、動的な高さを持つセルを生成するためには、
        // 開発者がセルの高さを計算する必要があった。
        // Self-Sizing Cellsを用いれば、
        // 次の3つの条件を満たしてさえいれば、動的な高さを持つセルを定義できる。
        // 1. セルのサイズを決定する制約が正しく定義されている。
        // 2. estimatedRowHeightが設定されている
        // 3. rowHeightがUITableViewAutomaticDimensionに設定されている。
        // Self-Sizing Cellsを用いると、estimatedRowHeightを設定した例と同様に
        // セルの高さの計算はセルが表示される直前に実行される。
        // 表示される直前までは、estimatedRowHeightとして設定された値の大きさになっており、
        // スクロールバーの高さもこの値を元にしている。
        // １番の違いは、Self-Sizing Cellsでは、tableView(_:. heightForRowAt:IndexPath)で
        // 明示的に高さの計算を行う必要がない点である。
        // 自動的にsystemLayoutSizeFittingSize(_:)を用いているセルの高さが計算される。
        // これはオフスクリーンセルとし紹介されている動的なセルの計算方法と同じである。
        // iOS8.0以降では、少ないコード量で同じことを実現することができる。
        // また、セル内のラベルにpreferredMaxLayoutWidthを設定する必要も基本的にない。
        // estimatedRowHeightを任意の値に設定し、
        // roHeightをUITableView.automaticDimensionとすることで
        // Self-Sizing Cellsとして動的にセルの高さが計算される。
        // Self-Sizing Cellsの計算方法は、基本的にオフスクリーンセルの計算方法と同じなので、
        // パフォーマンスの差はほとんどない。
        // どちらの場合も、高さ計算をセルの生成時に実施するので、
        // セル生成コストが非常に高い場合は、スクロールが不自然になる可能性がある。
        // もしデータソースの数が少ないのであれば、estimatedRowHeightを用いずに
        // データロード時に一度にセルの高さを計算してしまう方が良い場合もある。
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: SecondViewCell.nibName, bundle: nil), forCellReuseIdentifier: SecondViewCell.reuseIdentifier)
    }
}

extension SecondViewController: UITableViewDelegate {
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let people else {
            fatalError("People is nil")
        }
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondViewCell.reuseIdentifier, for: indexPath) as? SecondViewCell else {
            fatalError("Your SecondViewCell Identifier is invalid.")
        }
        
        guard let people else {
            fatalError("People is nil")
        }
        
        cell.layoutWithData(data: people[indexPath.row])
        
        return cell
    }
}
