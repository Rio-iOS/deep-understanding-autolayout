//
//  PrivateMethods.h
//  chapter08
//
//  Created by 藤門莉生 on 2024/08/17.
//

#import <UIKit/UIKit.h>

// 曖昧なレイアウトをデバッグする上で、
// より詳しい情報を取得するには、
// Objective-CにおけるUIViewのプライベートメソッドを用いることができる。
// これらのプライベートメソッドは非常に便利だが、
// Appleのドキュメントに記載されておらず、
// リリース用のビルドに含めるとリジェクトの対象になる可能性があるため、
// プライベートメソッドがリリース用のビルドに含まれないように注意する。
// Objective-CにおけるプライベートメソッドをSwiftで用いるには、
// Objective-C側でインタフェースを定義し、ブリッジする必要がある。
// Objective-CのPrivateMethods.hファイルで以下のように定義。
@interface NSObject ()
- (NSString *)_ivarDescription;
@end

@interface UIView ()
- (NSString *)recursiveDescription;
- (NSString *)_autolayoutTrace;
@end

@interface UIViewController ()
- (NSString *)_printHierarchy;
@end
