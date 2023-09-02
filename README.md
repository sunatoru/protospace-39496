# テーブル設計

## Usersテーブル

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| name               | string  | null: false                |
| email              | string  | null: false, unique: true  |
| profile            | text    | null: false                |
| position           | text    | null: false                |
| occupation         | text    | null: false                |
| encrypted_password | string  | null: false                |

### Association
- has_many :comments
- has_many :prototypes

## Prototypesテーブル

| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| concept         | text        | null: false                    |
| user            | references  | null: false, foreign_key: true |
| catch_copy      | text        | null: false                    |
| title           | text        | null: false                    |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
| Column          | type        | Option                         |
| --------------- | ----------- | -------------------------------|
| content         | text        | null: false                    |
| user            | references  | null: false, foreign_key: true |
| prototype       | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype