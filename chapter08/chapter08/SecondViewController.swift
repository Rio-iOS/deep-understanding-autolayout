//
//  SecondViewController.swift
//  chapter08
//
//  Created by 藤門莉生 on 2024/08/17.
//

import Foundation
import UIKit

final class SecondViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func recursiveDescription(_ sender: Any) {
        // 製品用のコードを書いていると、複数のビューコンポーネントが関連し合って、
        // 複雑な階層構造となる場合がある。
        // 階層が複雑になると、
        // 「追加したはずのビューが表示されない」、「追加したビューが予想外の場所に配置されている」など
        // 原因の分かりにくい事象が発生しがちである。
        // recursiveDescriptionは、対象となるビューの階層を再帰的に表示する。
        // 「|」はレイアウトの階層を表す。
        textView.text = view.recursiveDescription()
        textView.textColor = .white
    }
    
    @IBAction func autolayoutTrace(_ sender: Any) {
        // ビューの階層構造とAutoLayoutの情報を出力
        // recursiveDescriptionは、最終的なレイアウトのフレームと階層に関する情報は
        // 与えられるものの、AutoLayoutに関する情報は得ることができない。
        // そこで、autolayoutTraceというプライベートメソッドを利用する。
        // このメソッドは、ビューの階層情報と、そのレイアウトが制約定義によって
        // 実装されているかどうかを表示する。
        // つまり、曖昧なレイアウトをオブジェクトの階層情報と共に出力することができる。
        // 出力中に表示されるレイアウトについての記号
        // 記号 | 内容
        // * | AutoLayoutによるレイアウト
        // + | AutoLayoutを用いていないレイアウト
        // ・ | レイアウトエンジンのホスト
        textView.text = view._autolayoutTrace()
        textView.textColor = .white
    }
    
    @IBAction func printHierarchy(_ sender: Any) {
        // ViewControllerの階層を表示する
        // ビューの階層情報を表示したように、
        // ViewControllerの階層情報を表示することもできる。
        // printHierarchyというプライベートメソッドを利用する。
        textView.text = _printHierarchy()
        textView.textColor  = .white
    }
    
    @IBAction func ivarDescription(_ sender: Any) {
        // 全てのインスタンスを確認する
        // レイアウトの階層と曖昧なレイアウトについての情報を確認しても
        // レイアウトを正しく実行できない場合は、正しくインスタンスが生成されていない。
        // もしくは正しく所有されていない可能性がある。
        // その場合は、NSObjectのプライベートメソッドである
        //ivarDescriptionを利用する。
        textView.text = view._ivarDescription()
        textView.textColor = .white
    }
}
