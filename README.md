# README

# 将棋SNS
 
が作成したアプリは、「将棋SNS」と呼びます。私は社会人から将棋を始めました。最初に直面した課題としては、「ルールを覚えたのはいいけど、その後、どのように将棋を指していいか検討が付かない。本屋にある書籍はどれも中級者向けである」ということです。初心者が将棋を、より効率的に学べて、将棋を楽しんで欲しいと思い、このアプリを作成しました。具体的な機能としては、チャット形式で、将棋の質問ができ、それを将棋に詳しい方が回答をするという機能です。初心者が楽しく将棋を学べることに加えて、教える側も「教えたい」欲求を満たせます。

# DEMO

URL: https://docs.google.com/presentation/d/1WWWFnCBXBfXBCPhr7_4b5kYXmClYAU_RTOWDrCpDhcY/edit#slide=id.p
 
# Author
 
作成情報を列挙する
 
* 作成者: 矢野敬太
* E-mail: chorus1717@gmail.com

# DB
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