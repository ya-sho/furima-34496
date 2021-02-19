#テーブル設計

  usersテーブル

| Column             | Type    | Options                   |    
| ---------------    | ------  | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth              | date    | null: false               | 

   Association

- has_many :items
  has_many :purchases


itemsテーブル

| Column      | Type       | Options                        |    
| ---------   | ------     | -----------------------------  |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| cost_id     | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


   Association

- belongs_to  :user
- has_many    :comments
  belongs_to  :purchase
  

commentsテーブル

| Column     | Type        | Options                        |    
| ---------  | ----------  | -----------------------------  |
| text       | text        | null: false                    |
| item       | references  | null: false, foreign_key: true |


   Association
   
- belongs_to :item


purchasesテーブル

| Column          | Type        | Options                        |    
| --------------  | ----------  | -----------------------------  |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |


  belongs_to :user 
  has_many   :items 
  has_one    :address

addressesテーブル

| Column          | Type        | Options                        |    
| --------------  | ----------  | -----------------------------  |
| postal_code     | string      | null: false                    |
| area_id         | integer     | null: false                    |
| municipality    | string      | null: false                    | 
| address         | string      | null: false                    | 
| building        | string      |                                |
| phone_number    | string      | null: false                    | 
| purchase        | references  | null: false, foreign_key: true |

   Association
   
   belongs_to :purchase 


