import Foundation
import UIKit

final class FirstViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var people: [Person]?
    private var cellForCalculatingHeight: FirstViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = Person.generateCellData()
        setupTableView()
        setupCnostraints()
    }
}

private extension FirstViewController {
    func setupCnostraints() {
        // 動的な高さのテーブルビューセル
        // UITableViewはiOSにおける中心的なビューコンポーネントである。
        // （利用例）
        // - SNSのランタイムアプリ
        // - アプリの設定画面
        // - メモリ効率の良さから詳細情報を表示する画面
        // テーブルビューは複数のテーブルビューセルによって構成されており、
        // 表示するコンテンツに合わせてセルの高さを動的に変更したり、
        // 複数の種類のセルを用いたりする必要がある。
        // このテーブルビューの高さを指定する方法は3つある。
        // - 1. UITableViewのrowHeightプロパティに設定する方法
        //   - セルの高さが全てのテーブルビューセルで同じ場合は、この方法を用いることができる。
        //   - 決まった値（設定したい高さ）を一度代入すれば良いので、実行時にセルの高さを計算する必要がない。
        //   - tableView.rowHeight = 120.0
        // - 2. UITableViewDelegateのデリゲートメソッドであるtableView(_:heightForRowIndexPath:)に動的な高さを与える方法
        //   - このデリゲートメソッド内で、カスタムセルのオブジェクトを生成し、高さを計算することで、動的な高さを持つセルを実現できる。
        // - 3. iOS 8.0 で登場したSelf-Sizing Cellsを用いる方法である。
        //   - Self-Sizing Cellsを用いると、正しい制約が与えられていれば、開発者がセルの高さを計算しなくても、セルの高さが動的に変更される。
        
        // オフスクリーンセルによる高さの計算
        // 動的な高さを持つテーブルビューセルを作る方法の1つ目は、
        // UITableViewDelegateのtableView(_:heightForRowAtIndexPath:)デリゲートメソッド内で
        // セルの高さを計算する方法である。
        // セルとその制約をオフスクリーンで生成し、このオフスクリーンセルの高さをレイアウトエンジンを
        // 用いて計算することができる。
        // メリット・デメリットはあるが、オフスクリーンセルの考え方やレイアウトの定義方法は、
        // Self-Sizing Cellsを用いた場合も変わらない。
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        // .xibから作成する場合は、UINib(nibName:, bundle:)を利用する
        tableView.register(UINib(nibName: FirstViewCell.nibName, bundle: nil), forCellReuseIdentifier: FirstViewCell.reuseIdentifier)
        // estimatedRowHeightは以下のように指定することができる。
        tableView.estimatedRowHeight = 100
    }
}

extension FirstViewController: UITableViewDelegate {
    // tableView(_:,heigtForRowAt:,IndexPath:)は、
    // テーブルビューがスクロールビュー領域の長さを決定するため
    // データソースの数だけ呼ばれる。
    // そのため、データの数が増えれば増えるほど、
    // 計算に時間がかかるようになっている。
    // - データ数とテーブルビュー表示までの時間の関係
    //   - データ数 | テーブルビュー表示までの時間（秒）
    //     - 100 | 0.834
    //     - 1000 | 8.57
    //     - 10000 | 89.88
    // データの桁数が増えると、表示までの時間も1つ桁が増えている。
    // なぜそのようなことが起こるのか？
    // - UITableViewが、まずtableView(_:,heightForRowAt:,IndexPath:)で
    // 全てのセルの高さを計算してから、
    // tableView(_:, cellForRowAt:, IndexPath:)で表示に必要な分のセルの描画を実行するからである。
    // tableView(_: UITableView,cellForRowAt: IndexPath)は、
    // レイアウトに必要なセルのみを生成し、スクロール時には表示されなくなったセルを再利用することで、
    // 効率を高めている。
    // しかし、今回のコードでは、全ての行に対してセルを生成し、データを代入し、セルrの高さを計算しているので、
    // 計算コストが高く、非常に非効率的になっている。
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // セルの高さを定義する
        // tableView(_:cellForRowAt:,IndexPath:)を用いる。
        // tableView(_:,cellForRowAt:,IndexPath:)よりも先に呼ばれるため、
        // このメソッド内でもセルを生成し、Auto Layoutによるレイアウトを実施する必要がある。
        // このセルは生成されるものの画面上には表示されないので、オフスクリーンセルと呼ぶ。
        // セルの高さを定義するtableView(_:heightForRowAt:indexPath:)メソッド内で、
        // オフスクリーンセルを用いると次のようになる。
        // 💡[重要]
        // - この時、.dequeueReusableCell(withIdentifier:,for:)を呼び出すと、
        // - セルの高さ取得し、セットするために、tableView(_:heightForRowAtIndexPath:)が呼ばれてしまって、
        // - ループを抜けられなくなるので、ここではdequeReusableCellWithIdentifier(_:)を用いる。
        // 💡🙅‍♂️非効率な処理になっている。
        /*
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewCell.reuseIdentifier) as? FirstViewCell else {
            fatalError("Your cell identifier is invalid")
        }
        
        guard let people else {
            fatalError("People is nil")
        }
        // レイアウト用データを代入
        cell.layoutWithData(data: people[indexPath.row])
      
        // レイアウトに必要なテーブルビューの幅を与える
        cell.bounds = .init(
            x: 0,
            y: 0,
            width: CGRectGetWidth(
                tableView.bounds
            ),
            height: CGRectGetHeight(cell.bounds)
        )
        
        // セルの高さを計算する
        return cell.calculateHeight()
        */
       
        // 💡🙆 上記の処理を効率的な処理に書き換える。
        // セルの高さを計算しているメソッドtableView(_: UITableView, heightForRowAt: IndexPath)内では、
        // 高さの計算を実行する度に登録されているカスタムセルのプロトタイプを呼び出していた。
        // このセルは本来であれば再利用できるセルである。
        // 以下のように書くことで、セルを再利用し、実行時間を短縮することができる。
        // セルの生成回数を減らした場合の、データ数とテーブルビュー表示までの時間関係
        // データ数 | テーブルビュー表示までの時間（秒）
        // 100 | 0.28
        // 1000 | 1.71
        // 10000 | 19.69
        // 高さの計算および表示までの時間が大きく減っている。
        // iOS 7.0以降であれば、テーブルビューのestimatedRowHeightプロパティを設定することによって、
        // さらにパフォーマンスを改善できる。
        // estimatedRowHeightプロパティが設定されると、
        // 表示される直前までestimatedRowHeightがセルの高さとして扱われ、
        // セルの表示直前にセルの高さが計算される。
        let cell: FirstViewCell
        // セル生成時の計算コストを減らすために一度だけインスタンス化する
        if let reusableCell = cellForCalculatingHeight {
            cell = reusableCell
        } else if let reusableCell = tableView.dequeueReusableCell(withIdentifier: FirstViewCell.reuseIdentifier) as? FirstViewCell {
            cell = reusableCell
            cellForCalculatingHeight = cell
        } else {
            return 0
        }
       
        guard let people else {
            fatalError("People is nil")
        }
        
        cell.layoutWithData(data: people[indexPath.row])
        cell.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds))
        return cell.calculateHeight()
    }
}

extension FirstViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルの高さを取得する
        // UITableViewDataSourceのtableView(_:cellForRowAt:,IndexPath:)で生成
        // 1. dequeueReusableCellWithIdentifier(_:)を用いて、再利用可能なセルを取得し、
        // カスタムセル内で定義されたレイアウトメソッドにより表示するデータを渡し、
        // そのセルを戻り値として返す。
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewCell.reuseIdentifier, for: indexPath) as? FirstViewCell else {
            fatalError("Your cell identifier is invalid")
        }
        guard let people else {
            fatalError("People is nil")
        }
        // データを渡し、レイアウトを実行
        cell.layoutWithData(data: people[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let people else {
            fatalError("People is nil")
        }
        return people.count
    }
  
    // estimatedRowHeigtの指定
    // UITableViewDelegateのtablleView(_:, estimatedHeightForRowAt: IndexPath)デリゲートメソッドからも設定できる。
    // デリゲートメソッド内で設定する場合は、tableView(heightForRowAtIndexPath:)内でセルの高さを取得していた時のように
    // オフスクリーンセルを生成して全てのセルの高さを計算することができる。
    // 計算コストが高いので、基本的には定数を指定する。
    // estimatedRowHeightと計算結果のセルの高さの2つが大きくかけ離れると、
    // スクロールバーが伸び縮みしたり、スクロールが不自然になったりする可能性があるため、
    // 注意が必要である。
    // この値を設定することにより、速度がさらに向上する。
    // estimatedRowHeight設定後の、データ数とテーブル表示までの時間の関係
    // データ数 | テーブルビュー表示までの時間の関係
    // 100 | 0.077
    // 1000 | 0.076
    // 10000 | 0.098
    // AutoLayoutとTableViewに関するテクニックを用いることで、
    // セルを作ることができる。
    // iOS7.0をサポートする場合、オフスクリーンセルを用いるが、
    // iOS8.0以降をサポートするのであれば、Self-Sizing Cellsを用いることで、
    // さらに簡単に動的なセルを作ることができる。
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
