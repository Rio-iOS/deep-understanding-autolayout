//
//  SecondViewController.swift
//  chapter05
//
//  Created by 藤門莉生 on 2024/08/12.
//

import Foundation
import UIKit

final class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

private extension SecondViewController {
    func setupConstraints() {
        view.backgroundColor = .systemBackground
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
       
        view.addSubview(label)
        view.addSubview(button)
        // Visual Format Languagee（VFL: 視覚的書式言語）は、
        // ビューのレイアウトをASCIIアートのような文字列で表現する。
        // 1つの文字列で、縦横の制約を与える方向、対象オブジェクト、オブジェクト間の距離、並び方を指定できる。
        // デフォルトの設定だと、文字列の先頭がレイアウトのLeadingに、末尾がレイアウトのTrailingに対応しているので、
        // 日本語や英語のように左から右に文字を書く言語であれば、VFL文字列と同じように見た目のレイアウトとなる。
        // VFLは、NSLayoutCnstraintのクラスメソッド内で用いるが、戻り値はNSLayoutConstraintの
        // オブジェクトではなく、生成する制約が1つでもあってもNSLayoutConstraintの配列なので注意が必要である。
        // VFLを用いた制約の初期化は以下のメソッドを用いて実行する。
        // class func constraintWithVisualFormat(_ format: String, options opts: NSLayoutFormatOptions, metrics metrics: [String: AnyObject]?, views views: [String: AnyObject]) -> [NSLayoutConstraint]
       
        // "H:|-[label]-8-[button]"がVFLである。
        // labelの水平方向の距離をデフォルト値とする制約、labelとbuttonの水平方向の距離を8ptとする制約が定義されている。
        // 2つの制約を同時に定義しており、horizontalConstraintsは制約の配列になる。
        // VFLを用いないと、制約を2つ別々に生成する必要がある。
        // VFLの方がコード量が少なく記述できる。
        // 一方、VFLの文字列はあくまでも単なる文字列なので、
        // 実行時までレイアウトが正しく実行されるのかわからず、
        // 実行時のエラーも各制約に対してではなく、VFL文字列に対するものになるため、
        // デバッグしにくいというデメリットもある。
        // また、ratioを指定できないため、一部のレイアウトに制限がある。
        // メリットもある。
        // VFLは、文字列でレイアウトを擬似的に表現しているため、直感的にレイアウトを想像しやすく、
        // インタフェースオブジェクトの入れ替えなどの変更が容易であることもその1つである。
        
        // VFLフォーマット
        // - レイアウトの方向
        //   - V: -> 垂直方向の制約を生成
        //   - H: -> 水平方向の制約を生成
        // - レイアウト対象のオブジェクト
        //   - [view]: -> viewオブジェクト
        //     - VFLでレイアウト対象となるオブジェクトは角括弧で囲んで表記する。
        //     - ビューオブジェクトの名前は、viewsパラメータとしてDictionary形式で表され、
        //     - keyがVFLでの表記名、valueがItemとなるオブジェクトとなる。
        //   - | -> 親ビュー
        // - オブジェクト間のスペース
        //   - |-20-[view] -> 親ビューとviewの距離は、20pt
        //   - |-(-15)-[view] -> 親ビューとviewの距離は、-15pt
        //   - |-[view] -> 親ビューとviewの距離はデフォルト値
        //   - |[view] -> 親ビューとviewの距離は0pt
        //     - VFLを用いてスペースを表現するには、ハイフンでビューを繋ぎ、ビューの間に距離（制約定数）を記入する。
        //     - 距離を0ptにしたい場合は、[view1] - 0 - [view2]となるが、
        //     - ハイフンと数字を省略して、[view1][view2]と書くこともできる。
        //     - [view1] - [view2]と記述すると、Appleが定義したデフォルトの距離が設定される。
        // - オブジェクトのサイズ
        //   - H:[view(100)] -> viewの幅は100pt
        //   - H:[view1(==view2)] -> view1の幅はview2に等しい
        // - Relationship（関係性）
        //   - [view1] - (>=50) - [view2] -> view1とview2の距離は50pt以上
        //   - H:[view1(>=50, <=100)] -> viewの幅は50pt以上、100pt以下
        //     - VFLを用いて、NSLayoutConstraintにおけるRelationshipを定義した場合は、
        //     - 等号==, 大なりイコール>=, 小なりイコール<=のどれかを制約定数の前に記述する。
        //     - カンマ,で繋いで複数値を渡すことも可能
        // - Priority 優先度
        //   - H:[view(100@750)] -> viewの幅は優先度750で100pt
        //     - 優先度（Priority）を設定するには、制約定数の直後に@定数という形式で記述する。
        //     - VFL文字列によって生成されるのは、通常のNSLayoutConstraintなので、優先度の扱いは通常の制約と同様である。
        // - Alignment Option - 揃え方
        //   - Alignment OptionはVFLを用いてNSLayoutConstraintを初期化するときに用いるconstraintWithVisualFormat(-:options:metrics:views:)メソッドのoptionsパラメータとして、VFLで記述した制約に対する直行方向の並び方を指定するビットマスクである。
        //   - Alignment Optionは水平方向、垂直方向、方向性の3種類に分けることができる。
        //   - 水平方向のAlignmentはオブジェクトを水平方向のどの軸に揃えるか、垂直方向のAlignment Optionはオブジェクトを垂直方向のどの軸に揃えるかを指定できる。
        //   - 方向性のAlignment Optionは、VFLを左右どちらから読んでオブジェクト配置を実行するか指定する。
        //   - 水平方向のAlignment Otionは以下のパラメータから選択することが可能である。
        //   - 水平方向のAlignment Option
        //     - NSLayoutFrmatAlignAllLeft: 全てのビューを左寄せ
        //     - NSLayoutFrmatAlignAllRight: 全てのビューを右寄せ
        //     - NSLayoutFrmatAlignAllLeading: 全てのビューをLeading寄せ
        //     - NSLayoutFrmatAlignAllTrailing: 全てのビューをTrailing寄せ
        //     - NSLayoutFrmatAlignAllCenterX: 全てのビューをx方向中央に揃える
        //   - 垂直方向のAlignment Optionの値を設定できる。
        //     - NSLayoutFormatAlignAllTop: 全てのビューを上部寄せ
        //     - NSLayoutFormatAlignAllBottom: 全てのビューを下部寄せ
        //     - NSLayoutFormatAlignAllCenterY: 全てのビューをy軸方向中央揃え
        //     - NSLayoutFormatAlignAllBaseline: 全てのビューをベースラインに揃える
        //   - 方向性は、VFLで記述したレイアウトを左右どちらから並べるかを指定する。
        //   - デフォルトの値はNSLayoutFormatDirectionLeadingToTrailingで、
        //     LeadingからTrailingに向かってレイアウトされるため、多くの場合は指定しなくても問題ない。
        //   - 指定する場合は以下である。
        //   - NSLayoutFormatDirectionLeadingToTrailing: 水平方向LeadingからTrailing方向に並べる（並べる）
        //   - NSLayoutFormatDirectionLeftToRight: 水平方向左から右方向に並べる
        //   - NSLayoutFormatDirectionRightToLeft: 水平方向右から左に並べる
        // - メトリクス - 制約定数に変数を代入
        //   - レイアウトに必要な制約定数が実行時までわからない場合は、constraintsWithVisualFormat(_:options:metrics:views:)メソッドのmetricsパラメータを用いることで変数を代入できる。
        //   - このmetricsパラメータはDictionary形式で設定する。
        //   - keyはVFL文字列で用いる変数名、valueは代入する値である。
        let horizontalConstarints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[label]-8-[button]",
            options: .alignAllTop,
            metrics: nil,
            views: ["label": label, "button": button]
        )
        for constarint in horizontalConstarints {
            constarint.isActive = true
        }
        
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[label]",
            options: .alignAllTop,
            metrics: nil,
            views: ["label": label]
        )
        for constraint in verticalConstraints {
            constraint.isActive = true
        }
    }
}
