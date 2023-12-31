![スクリーンショット 2023-07-21 11 52 57](https://github.com/20230714/Nagano_cake/assets/135484706/36a3165e-d688-46de-b828-53757f46ad16)

# 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイトを開発しました。

このECサイトはDMM WEB CAMP生によるチーム開発課題です。実在するお店のサイトではありませんのでご了承ください。

# 案件の背景

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。

InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、

管理機能を含んだ通販サイトを開設しようと思い至った。

# 開発環境

-   ruby 3.1.2
-   Rails 6.1.7.4
-   Bootstrap v4.6.2

# 実装した機能

-   顧客側
    -   会員登録、ログイン・ログアウト、退会
    -   会員情報の編集
    -   カートへの追加、商品購入
    -   支払い方法、配送先の指定
    -   配送先の登録、編集
      
-   管理者側
    -   商品の新規追加、編集
    -   商品情報の編集
    -   会員登録されているユーザ情報の編集、退会処理
    -   注文ステータス、制作ステータスの編集
      
-   追加機能 　
    -   商品名キーワード検索
    -   ジャンル検索
      
# 管理者ページへのログイン方法
```
email: 'admin@teamb',
password: 'testlogin'
```

# チームメンバー
-  過足拓也(よぎ）
-  宗像竜也　（たつ）
-  柴田淳也（しばじゅん）
