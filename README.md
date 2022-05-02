# README

# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ------     | -----------               |
| name               | string     | null: false, unique: true | ユニーク制約
| email              | string     | null: false               | ユニーク制約
| encrypted_password | string     | null: false               |
| profile            | text       | null: false               |
| occupation         | text       | null: false               |
| position           | text       | null: false               |

### prototypesテーブル

| Column             | Type     | Options                        |
| ------------------ | ------   | -----------                    |
| title              | string   | null: false                    | 
| catch_copy         | text     | null: false                    | 
| concept            | text     | null: false                    |
| user               |references| null: false, foreign_key: true | 外部キー

### Association

- belongs_to :user
- has_many :comments

####　commentsテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| prototype   | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

 
### Association

- belongs_to :prototype
- belongs_to :user



