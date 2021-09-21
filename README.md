========== =========== ==========
## Manegement for Cloud
========== =========== ==========
<br>
<br>


## --アプリケーション名-- 
---
## Manegement for Cloud
<br>


## --アプリケーション概要--
---
### 勤怠確認アプリ
 <br>


 ## --アプリケーション情報--
 ---
 -  URL(TOPページ)：https://yoshida-manegement.herokuapp.com/
 -  テスト用アカウント① <br>
  メールアドレス：test@test<br>
  パスワード：123asd
 - テスト用アカウント② <br>
 メールアドレス：test2@test<br>
 パスワード：123asd

 <br>


 ## --アプリケーションの目的--
 ---
 ポケットモンスターのゲームをプレイしている人を対象に開発。
 プレイヤーのパーティ(利用しているポケモン)情報の投稿・共有がメイン。<br>
 現在、ポケットモンスターのゲームにてパーティ情報は、プレイヤー個人が
 各々ブログ等に投稿しておリ、閲覧者は投稿されたものを探し内容を見にいく。<br>
 ブログの収集サイトは存在するが、管理人が毎月手作業でブログを探し、
 リンクを貼り付けるというスタイルで収集サイトの管理人の裁量次第。<br>
 本アプリケーションが、パーティ投稿のプラットフォームとなることで 
 パーティ情報の一元管理を行い、他のプレイヤーの情報に触れる機会を増やす
 ことで各プレイヤーのレベルアップ、プレイ人口の増加を目指す。
 <br><br>

## --機能利用方法--
 ---
 ## 【出勤登録】
 ### ①TOPページ中央の「出勤する」をクリック
 #### →出勤登録ページに遷移します。
 ### ②「日付」・「出勤時間」・「時間外時間」を入力し登録ボタンをクリック
 #### →出勤データが登録されTOPページに遷移します。
<br>

<br>

 ## 【退勤登録】
 ### ①TOPページ中央の「退勤する」をクリック
 #### →退勤登録ページに遷移します。
 ### ②「日付」・「出勤時間」・「時間外時間」を入力し登録ボタンをクリック
 #### →出勤データが登録されTOPページに遷移します。
 <br>

<br>

 ## 【休暇登録】
 ### ①TOPページ中央の「休暇申請」をクリック
 #### →休暇登録ページに遷移します。
 ### ②「日付」・「休暇区分」を入力し申請ボタンをクリック
 #### →休暇データが登録されTOPページに遷移します。
 #### ※休暇登録ページの下部、「休暇履歴はこちら」から休暇一覧ページに遷移することができ、休暇の編集や削除が行なえます。
 <br>
 <br>

 ## 【勤怠編集・確認】
 ### ①TOPページ中央の「勤怠記録」をクリック
 #### →勤怠記録ページに遷移します。勤怠記録を確認できます。
 ### ②編集したい日付の勤怠の編集ボタンをクリック
 #### →編集ページに遷移します。
 ### ②変更する情報を入力し変更ボタンをクリック
 #### →編集が完了し記録ページに戻ります。
 <br>
 <br>

 ## 【個人ページ】
 ### ①TOPページ上部の「ユーザー名」をクリック
 #### →個人ページに遷移します。
 ### ②当月、年間の個人の勤怠・休暇情報を確認できます。
 
 <br>
 <br>




 ## --今後の機能追加予定--
---
### ・ポケモンの詳細画面の追加
### ・計算ツールの追加
### ・記事検索の項目の追加

<br>
<br>

## --ローカルでの動作方法--
---
### git cloneコマンド  <br>
git clone https://github.com/yoshidanoryota/yoshida-manegement.git

### 開発環境
Ruby / Ruby on Rails / HTML / CSS/ JavaScript / MySQL / GitHub / Heroku / Visual Studio Code



###


<br>
<br>

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| number             | string  | null: false |
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
- has_many :comments






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






## commentsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| text          | string     |                                |


### Association
- belongs_to :user