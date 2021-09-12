# README

<!-- usersテーブル -->

* usersテーブル

|Column              |Type             |Options                    |
|--------------------|-----------------|---------------------------| 
| email              | string          | null: false, unique: true | #email
| encrypted_password | string          | null: false               | #password
| nickname           | string          | null: false               | #nickname
| kiryoku_id         | integer         | null: false               | #棋力

* * Association
- has_many : tweets
- has_many : games
- has_many : game_comments
- has_many : comments



<!-- tweetsテーブル -->

* tweetsテーブル(将棋SNSの質問テーブル)

|Column   |Type     |Options                         |
|---------|---------|--------------------------------|
| text    | text    | null: false                    | #質問内容
| tag     | string  | null: false                    | #局面
| user_id | integer | null: false, foreign_key: true | #user_id外部キー参照

* * Association
- belongs_to : user
- has_many : comments


<!-- commentsテーブル -->

* commentsテーブル

|Column    |Type     |Options                         |
|----------|---------|--------------------------------|
| text     | text    | null: false                    | #質問内容
| user_id  | integer | null: false, foreign_key: true | #user_id外部キー参照
| tweet_id | integer | null: false, foreign_key: true | #tweet_id外部キー参照

* * Association
- belongs_to : user
- belongs_to : tweet


<!-- gamesテーブル -->

* gamesテーブル

|Column        |Type     |Options                         |
|--------------|---------|--------------------------------| 
| game_app     | string  | null: false                    | #使用する将棋アプリ
| text         | text    | null: false                    | #コメント
| kiryoku_id   | integer | null: false                    | #棋力
| user_id      | integer | null: false, foreign_key: true | #user_id外部キー参照

* * Association
- belongs_to : user
- has_many : game_comments


<!-- game_commentsテーブル -->

* game_commentsテーブル

| Column            |Type     |Options                         |
|-------------------|---------|--------------------------------| 
| game_comment_text | text    | null: false                    | #コメント
| user_id           | integer | null: false, foreign_key: true | #user_id外部キー参照
| game_id           | integer | null: false, foreign_key: true | #game_id外部キー参照

* * Association
- belongs_to : user
- belongs_to : game