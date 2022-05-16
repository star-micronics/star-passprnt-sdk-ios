********************************************************
      Star PassPRNT iOS SDK Ver 2.3.0
         Readme_Jp.txt              スター精密（株）
********************************************************

 1. 概要
 2. 内容
 3. 適用
 4. 著作権
 5. 変更履歴

==========
 1. 概要
==========
  本パッケージは、iOSのStar PassPRNT専用SDKです。
  “PassPRNT”とは、外部アプリケーション（以降、”連携アプリ”とする）と
  スターデバイス（以降、”デバイス”とする）の間に配置するアプリケーションです。
  このアプリケーションは、連携アプリからレシートのデザイン、用紙幅、その他に
  関連する情報を受け取ると印字データに変換して、プリンタに送信を行います。
  よって、連携アプリはプリンタとの通信に関わる部分の設計-開発の必要がありません。
  またプリンタステータスの監視や印刷成否の判定も行うため、連携アプリは
  それらの実施も不要となります。

  またレシートデザインは、HTML/PDFレイアウトに対応しているため、
  デバイス独自のコマンド仕様を理解する必要はありません。
  その他の受け渡しデータも、一般的なURL仕様に基づいてクエリの一部として
  組み込んで受け渡す仕様となっています。

  例：
   starpassprnt://v1/print/nopreview?html=<HTMLレイアウト>&size=3&drawer=on&back=<連携アプリ>

  詳細は別紙ドキュメントファイルを参照ください。

==========
 2. 内容
==========
  PassPRNT_iOS_SDK_Ver2.3.0
  |
  | Readme_En.txt                       // リリースノート(英語)
  | Readme_Jp.txt                       // リリースノート(日本語)
  | SoftwareLicenseAgreement.pdf        // ソフトウェア使用許諾書(英語)
  | SoftwareLicenseAgreement_jp.pdf     // ソフトウェア使用許諾書(日本語)
  | UsersManual_iOS.url                 // User Manualへのショートカット
  |
  +- Samples
     |- Objective-C
     |  +- PassPRNT_SDK_ObjC.xcodeproj  // Objective-C用サンプルプログラム
     |
     +- FileMaker
        |- PassPRNT_v2.0_2inch.fmp12    // File Maker用サンプルプログラム(2インチ用)
        |- PassPRNT_v2.0_3inch.fmp12    // File Maker用サンプルプログラム(3インチ用)
        +- PassPRNT_v2.0_4inch.fmp12    // File Maker用サンプルプログラム(4インチ用)

=============
 3. 適用
=============
  ■ 対象OS
   iOS 11.0 - 15.0.2

  ■ 対象ソフトウェア
   PassPRNT Ver2.5.0

  ■ 対象プリンタモデル
   ◇ プリンタモデル (F/W ver)
       SM-L200     (Ver 1.1以上 - StarPRNT mode)
       SM-S210I *1 (Ver 3.0以上 - StarPRNT mode)
                   (Ver 2.5以上 - ESC/POS mode)
       SM-S220I *2 (Ver 3.0以上 - StarPRNT mode)
                   (Ver 2.1以上 - ESC/POS mode)
       SM-S230I *2 (Ver 1.0以上 - StarPRNT mode)
                   (Ver 1.0以上 - ESC/POS mode)
       SM-L300     (Ver 1.0以上 - StarPRNT mode)
       SM-T300I    (Ver 3.0以上 - StarPRNT mode)
                   (Ver 2.5以上 - ESC/POS mode)
       SM-T400I    (Ver 3.0以上 - StarPRNT mode)
                   (Ver 2.5以上 - ESC/POS mode)
       TSP650II    (Ver 2.1以上)
       TSP700II    (Ver 5.1以上)
       TSP800II    (Ver 2.1以上)
       TSP100IIIBI (Ver 1.0以上)
       TSP100IIIW  (Ver 1.4以上)
       TSP100IIILAN(Ver 1.3以上)
       TSP100IIIU  (Ver 1.0以上)
       TSP100IV    (Ver 1.0以上)
       FVP10       (Ver 1.3以上)
       BSC10    *2 (Ver 1.0以上)
       mPOP        (Ver 1.0.1以上)
       mC-Print2   (Ver 1.0以上)
       mC-Print3   (Ver 1.0以上)

       *1-日本向けモデルのみ
       *2-欧米向けモデルのみ

   ◇ 対応インターフェース
       Bluetooth: TSPシリーズ, FVP10, BSC10 (IFBD-HB03/HB04 Ver 1.0.0以上)
                : SM-L200, SM-L300を除くポータブルプリンタ
                : mPOP, mC-Print2, mC-Print3
       Bluetooth Low Energy : SM-L200, SM-L300
       Ethernet : TSPシリーズ, FVP10, BSC10 (IFBD-HE05/HE06 Ver 1.0.1以上)
                  mC-Print2, mC-Print3
       USB      : TSP100III, mC-Print2, mC-Print3 

===========
 4. 著作権
===========
  スター精密（株）Copyright 2015-2021

==================================
 5. Star PassPRNT iOS SDK 更新履歴
==================================
 Ver 2.3.0
  2021/10/29  : TSP100IVに対応
                ブザー(BU01), メロディースピーカー(mC-Sound)のサポートを追加

 Ver 2.2
  2020/01/23  : Webダウンロード印刷に対応 ('url'クエリ)
                ダークモード対応

 Ver 2.1
  2018/07/02  : 対応機種追加
                ドロアー駆動時間、カット方式設定対応
                不具合修正

 Ver 2.0
  2017/10/31  : 対応機種/インタフェース追加
                クエリ"bmposition"廃止
                不具合修正
