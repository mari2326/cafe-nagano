# アプリ名
  Cafe's Nagano  

# 概要
  ・長野県のお気に入りのcafeの写真や感想が投稿できる  
  ・投稿した内容を編集、削除できる（投稿者のみ）  
  ・投稿に対してコメントができる（ログインしているユーザーのみ）  
  
# 本番環境
  https://cafe-nagano.herokuapp.com/  

  ログイン情報(test用)  
   ①Eメール:test1@gmail.com  
    パスワード:test1111  
   ②Eメール:test2@gmail.com  
    パスワード:test2222  

# 制作背景 (意図)
  ①自分自身cafeが好きでよく行くのですが、長野県は隠れ家的なcafeが多いと感じ、行った方がお店の雰囲気等を投稿してくれて共有できるアプリがあれば、知らなかったお店を知れたり、紹介されたお店の方も喜ぶと思い制作しようと決めました。  
  ②これからコロナが落ち着いて、長野県に観光に来られた際に、長野のcafe情報が載っているアプリがあれば調べて行ってくれて、地域活性化にもなると思ったからです。  

# DEMO

  ## トップページ
  ![①9ae43fe9b7b214550b5f5d349aa218e0](https://user-images.githubusercontent.com/87653361/133192847-f5519a7c-4682-4968-a7b1-40e0ed8e351a.jpeg)  
  ・ヘッダーの初期表示は [ログイン] [新規登録] になっており、ログイン状態になると[nickname] [ログアウト] が表示されます。  
  ・投稿されている写真をクリックすると詳細ページへ遷移できるようになっています。また、各投稿の左下に投稿者のnicknameを表示させ、投稿者の一覧ページへ遷移できるようにもなっています。  

  ## 新規投稿ページ
  <img width="1440" alt="②a80eef49d684dfd6480cf6df4e4881c2" src="https://user-images.githubusercontent.com/87653361/133212688-c9992b7f-a30b-4528-b1cd-2bb7121d6192.png">
  ・トップページから [投稿する] ボタンをクリックするとこちらの新規投稿ページへ遷移します。ここで必要な情報、「写真,cafeの店名,感想等」を入力し、SENDボタンを押すとトップページへ遷移し、入力したcafeの情報が表示されます。最新投稿は、左上に順に追加されていきます。  
  ・各項目、空欄の状態でSENDボタンが押された場合はエラーとなりエラーメッセージが表示されます。  

  ## 詳細ページ（編集/削除）
  ![③67cedae899b22cc7b2a976c489945811](https://user-images.githubusercontent.com/87653361/133199288-be1c406e-4242-4740-9922-155db344e256.jpeg)  
  ・投稿された写真をクリックするとこちらの詳細ページへ遷移します。投稿者のみに編集/削除ボタンが表示され、編集/削除が可能となります。  
  ・編集時、空欄がある状態でSENDボタンが押されるとエラーメッセージが表示されます。  

  ## コメント投稿ページ
  ![④c612af3d77ca5c86688258a001dd0465](https://user-images.githubusercontent.com/87653361/133200052-ee3936d1-8a61-4189-9302-2929e88f271c.jpeg)  
  ・詳細ページから投稿に対してコメントができます。（ログインしているユーザーのみ）。コメントを入力しSENDボタンを押すと下の <コメント一覧> に表示されます。コメント投稿者のnicknameが表示されるようになっており、クリックするとコメント投稿者の一覧ページへ遷移できます。

# 工夫したポイント
  ・投稿一覧の写真をクリックすると各詳細ページへ遷移するように設定しました。  
  ・投稿した際に投稿者のnicknameが一緒に表示されるようにしました。  
  ・詳細ページにコメント投稿欄と<コメント一覧>を表示させることでわかりやすく、見やすくしました。  

# 使用技術（開発環境）
  ## バックエンド
  Ruby, Ruby on Rails

  ## フロントエンド
  HTML, CSS

  ## データベース
  MySQL, SequelPro

  ## インフラ
  AWS(S3)

  ## アプリケーションサーバー（本番環境）
  Heroku

  ## ソース管理
  GitHub, GitHubDesktop

  ## テスト
  RSpec

  ## エディタ
  VSCode

# 課題や今後実装したい機能  
・各機能の改善が必要な箇所を一つずつ解決していきたい。(ビュー等)  
・一通り実装ができたら追加機能として、複数枚写真が投稿できる機能とお店の住所を追加で投稿してそれに連動したMapが表示される機能を実装したいです。  
・まだまだ未熟者だが、必要な技術や知識を身につけコツコツと進めていきたい。  

# テーブル設計

  ## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               | 
| email              | string  | null: false, unique: true |

  ### Association
  - has_many :posts
  - has_many :comments


  ## posts テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------  | ------------------------------ |
| text                | text       | null: false                    | 
| user                | references | null: false, foreign_kye: true |

  ### Association

  - belongs_to :user
  - has_many :comments


  ## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false
| user      | references | null: false, foreign_key: true |
| cafe      | references | null: false, foreign_key: true |

  ### Association

  - belongs_to :user
  - belongs_to :post
