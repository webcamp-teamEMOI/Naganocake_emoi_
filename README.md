# Nagano Cake (概要)
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発
# アプリケーションの機能
## 【会員側】
1.会員登録機能
* 氏名、メールアドレス、パスワード、郵便番号、住所、電話番号を登録
* メールアドレス、パスワードにて登録
* マイページ
* 会員情報編集
* 退会

2.配送先機能
* 配送先登録/一覧
* 配送先編集

3.商品表示機能
* 商品一覧表示
* 商品詳細表示

4.注文機能
* 商品詳細よりショッピングカートへ商品追加
* ショッピングカート内アイテムの操作（カート内各アイテムの削除・一括削除・個数の変更）
* 注文情報入力
* 注文情報確認
* 注文完了

注）非ログイン時に利用できる機能はトップページ、商品一覧/詳細ページ表示のみです

## 【管理側】
1.ログイン機能
* seed.rbに直接記述されたメールアドレス、パスワードを使用

2.商品機能
* 商品一覧/詳細表示
* 商品新規登録

3.ジャンル機能
* ジャンル一覧/追加
* ジャンル編集

4.会員機能
* 会員一覧/詳細
* 会員情報編集

5.注文機能
* 注文履歴一覧/詳細

注）非ログイン時は上記の機能を使うことが出来ません

# 環境
■開発環境<br>
　Cloud9<br>
■フレームワーク<br>
　Ruby on Rails
# インストール
$ git clone　<br>
$ cd Naganocake_emoi_ <br>
$ bundle install<br>
# 推奨環境
ruby 2.6 以降 Rails 5.2.6 以降
# 開発者
* えぎっちゃん
* いっちー
* むー
* みかわや
