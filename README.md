# opml2indesign.xsl

opml2indexign.xsl は、OPML形式をInDesign用に整形するXMLスタイルシート(XSL)と、便利なタスクを設定したGruntfileでできたツールです。[OmniOutliner](http://www.omnigroup.com/omnioutliner)、[Tree](http://www.topoftree.jp/tree/)、[MindNode](http://mindnode.com/)、[Scapple](https://www.literatureandlatte.com/scapple.php)等の人気のエディタから出力したOPML形式のデータを、InDesignのドキュメントへ自動組版することができます。

## 使い方

### クイックスタート

InDesignを使ってXSLTを適用する使い方です。最もシンプルな手順で流し込みが行えます。

#### OPML書類を作成

任意のソフトウェアを使い、OPML形式のファイルを作成します。Tree、MindNodePro、Scappleなどのマインドマッピングツールや、各種アウトラインエディタが対応しています。

#### OPMLファイルの拡張子を.xmlに変更

拡張子を書き換えると、InDesignがXMLとして解釈できるようになります。

#### InDesignテンプレートを開く

resources/ 以下のInDesignテンプレートには、8〜12レベルの見出しと本文用のスタイルがXML構造にマップ済みです。CS4のINDD形式か、CS4以降のすべてのバージョンで互換性のあるIDML形式のいずれかを使用できます。

* a4_eng_cs4.indd, a4_eng_cs4-cc.idml - 英語用のテンプレートです。
* a4_jpn_CS4.indd, a4_eng_cs4-dd.idml - 日本語用のテンプレートです。

#### InDesignでXMLを読み込む

「ファイル > XMLを読み込み...」から、先程拡張子を書き換えたXMLファイルを選択します。この時に「XSLTを適用」をチェックし、opml2indesign.xslをスタイルシートとして適用します。

### Grunt.jsを使う方法

Grunt.jsを使うことで、拡張子の置き換えやXSLの適用をInDesignの外部で自動処理できます。OPMLを直接エディタで編集しながらInDesignに反映できるため、より原稿の執筆に集中できるワークフローが実現可能です。

#### grunt.jsとxsltprocを使用可能にする

node.jsのモジュールが利用可能な状態にセッティングしてください。xsltprocは、MacOSXであれば標準でインストールされています。

#### ディレクトリ src/opml 直下にOPML書類を作成

#### gruntを実行

以下のタスクが実行されます。

* src/opml 以下のファイルを監視
* 変更があった場合は、XSLTを適用して build 以下へ出力

#### build内に出力されたXMLファイルをInDesignで読み込む

この場合では、XSLTを適用せずにそのまま読み込みを行なってください。Gruntが走り続けている間は、OPMLファイルに変更がある度にXMLファイルが再生成されます。このファイルにInDesignからリンクを設定することで、情報のリロードを簡単に行うことができるようになります。

## トラブルシューティング

### 流し込んだテキストのスタイルがオーバーライド状態になってしまう場合

InDesignの仕様上、フレームグリッドへタグ付きテキストを流し込んだ際、フレームブリッド
自体のスタイルが優先的に適用されてしまうようです。以下の対処方法があります。

#### オーバーライドを全消去する場合

テキストフレーム内のテキストを「コマンド+A」ですべて選択し、段落スタイルパレットのメニューから「オーバーライドの消去」を実行します。

#### 同じXMLファイルを2回読み込む場合

テキストが流し込まれた後、もう一度同じファイルを同じ手順で読み込み直します。2回目の読み込み時に、正しいスタイルが適用されます。

## クレジット

### ライセンス

opml2indexign.xslと、それに付属するInDesignテンプレートはMITライセンスで配布されます。改変・再配布・商用利用は自由です。


Copyright (c) 2014 y_hokkey  
Released under the MIT license  
http://opensource.org/licenses/mit-license.php

### 著者

### y_hokkey

1988年生まれ。多摩グラ中退のグラフィックデザイナー。印刷物／Web／電子書籍／モバイルアプリ／業務用アプリケーションといった分野のデザインに携わっています。

こんなのも作ったりしています。  
http://metroexits.nobody.jp/