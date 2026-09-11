# deep-understanding-autolayout
よく分かるAutoLayout

## 検証環境と実行方法

検証用ツールチェーンはXcode 26.6 / Swift 6.3です。Swiftの言語モード・iOSの最低バージョンは各プロジェクトの設定を使用します。macOSでXcodeをインストールし、初回起動時の追加コンポーネントのインストールを完了してください。

リポジトリのルートで以下を実行します。

```sh
# 検証対象と番号の一覧
swift Scripts/verify.swift --list

# 全対象を順番に検証
swift Scripts/verify.swift

# 1件だけ検証（0始まり）
swift Scripts/verify.swift --index 0
```

アプリは署名不要のSimulator向けにビルドし、Swiftパッケージは `swift test` で検証します。作業用ディレクトリは実行ごとに作成・削除するため、初回と同様に時間がかかります。依存パッケージの取得にはネットワーク接続が必要です。

## 検証対象

| 番号 | 対象 | 種類 | 開く場所 |
| ---: | --- | --- | --- |
| 0 | `chapter01` | Simulatorビルド | `chapter01/chapter01.xcodeproj` |
| 1 | `chapter02` | Simulatorビルド | `chapter02/chapter02.xcodeproj` |
| 2 | `chapter03` | Simulatorビルド | `chapter03/chapter03.xcodeproj` |
| 3 | `chapter04` | Simulatorビルド | `chapter04/chapter04.xcodeproj` |
| 4 | `chapter05` | Simulatorビルド | `chapter05/chapter05.xcodeproj` |
| 5 | `chapter06` | Simulatorビルド | `chapter06/chapter06.xcodeproj` |
| 6 | `chapter07` | Simulatorビルド | `chapter07/chapter07.xcodeproj` |
| 7 | `chapter08` | Simulatorビルド | `chapter08/chapter08.xcodeproj` |
| 8 | `chapter09` | Simulatorビルド | `chapter09/chapter09.xcodeproj` |

アプリを操作するには表のworkspace（ある場合）またはprojectをXcodeで開き、対象のschemeとiPhone Simulatorを選択して実行します。実機で動かす場合は、ご自身のSigning Teamを設定してください。

## CIと検証範囲

`Quality` ワークフローは上記と同じ一覧・スクリプトを使い、対象ごとにビルドまたはテストを実行します。ビルドの成功だけでは、画面表示、アクセシビリティ、通信先の動作、テスト網羅性は保証されません。UIサンプルはSimulator上での操作確認も必要です。

## 振る舞いの回帰テスト

共通祖先を探すAPIをnearestCommonAncestor(with:)へ改名し、オブジェクトの同一性で探索します。制約の有効化はUILayoutGuideのowningViewも考慮し、共通祖先がなければfalseを返します。既存制約の検索は上位の祖先に設置された制約も含めます。

共通祖先・自分自身・別階層、UILayoutGuide、上位祖先に置かれた制約をUIKit上で検証します。

```sh
swift Scripts/test-layout.swift
```

## Swiftコード品質

[設計・命名・所有関係の方針と、この教材への適用範囲](SWIFT-QUALITY.md)を参照してください。
