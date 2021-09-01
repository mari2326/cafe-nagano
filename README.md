# アプリ名
  cafe's nagano

# 概要
  ・お気に入りのcafeの紹介文や画像を投稿できる  
  ・投稿した内容を編集、削除できる  
  ・投稿に対してコメントができる  
  ・投稿時に住所を記載すると地図が表示される  
  ・検索機能で条件を絞って投稿を見つけることができる

# 本番環境
  http://

  ログイン情報(test用)  
   Eメール：  
   パスワード:

# 制作背景 (意図)
  ①自分自身cafeが好きでよく行くのですが、長野県は隠れ家的な見つけにくいcafeが多いと感じ、行った方がお店の雰囲気等を投稿してくれて共有してくれるアプリがあれば、入りやすいし、お店の方も喜ぶと思い制作しようと決めました。  
  ②これからコロナが落ち着いて、長野県に観光客がきた際に、長野のcafe情報が載っているアプリがあれば調べて行ってくれて、地域活性化にもなると思ったからです。

# DEMO

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| encrypted_password | string  | null: false               | 
| email              | string  | null: false, unique: true |

### Association
- has_many :cafes
- has_many :comments


## cafes テーブル

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
- belongs_to :cafe
