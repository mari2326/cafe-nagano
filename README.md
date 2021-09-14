# アプリ名
  Cafe's Nagano  

# 概要
  ・長野県のお気に入りのcafeの写真や感想を投稿できる  
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
  ![①04312962cfa3e607a53f4e831ab75c3a](https://user-images.githubusercontent.com/87653361/133187840-51e8a9df-d961-4c4f-8c21-8c66dcabeb2f.jpeg)  
  ・ヘッダーの初期表示は [新規登録] [ログイン] になっており、ログイン状態になると[nickname] [ログアウト] が表示されます。  
  ・上中央の [投稿する] ボタンから写真,cafeの店名,感想を投稿することができます。最新投稿は、左上に追加されます。  
  ・投稿されている写真をクリックすると詳細ページへ遷移できるようになっています。また、各投稿の左下に投稿者のnicknameを表示させ、投稿者の一覧ページへ遷移できるようにもなっています。  

  ## 新規投稿ページ






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
