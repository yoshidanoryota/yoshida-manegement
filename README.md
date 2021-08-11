# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| user_name          | string  | null: false |
| user_number        | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| division_id        | integer | null: false |
| office_id          | integer | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |


### Association
- has_many :attendances
- has_many :outs
- has_many :rests
- has_many :comments





## attendancesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| arrive_id        | integer    | null: false                    |
| flying_id        | integer    |                                | 
| attendance_day   | date       | null: false                    |


### Association
- has_one :outs
- belongs_to :user






## outsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| attendance | references | null: false, foreign_key: true |
| off_id     | integer    | null: false                    |
| extra_id   | integer    |                                |
| out_day    | date       | null:false                     |

### Association
- belongs_to :user
- belongs_to :attendances






## restsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| holiday_id    | integer    | null: false                    |
| rest_day      | date       | null: false                    |


### Association
- belongs_to :user







## commentsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| text          | string     |                                |


### Association
- belongs_to :user
