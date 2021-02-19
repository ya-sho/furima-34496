#テーブル設計

  usersテーブル

| Column     | Type    | Options     |    
| ---------  | ------  | ----------  |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| name       | string  | null: false |
| name_kana  | string  | null: false |
| birth      | string  | null: false | 

   Association

- has_many :items
- has_many :purchases 

itemsテーブル

| Column      | Type       | Options                        |    
| ---------   | ------     | -----------------------------  |
| item_name   | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | text       | null: false                    |
| status      | text       | null: false                    |
| cost        | text       | null: false                    |
| area        | text       | null: false                    |
| days        | text       | null: false                    |
| price       | Integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


   Association

- belongs_to :user
- has_many   :comments
  has_one    :purchase 

commentsテーブル

| Column     | Type        | Options                        |    
| ---------  | ----------  | -----------------------------  |
| text       | text        | null: false                    |
| item       | references  | null: false, foreign_key: true |


   Association
   
- belongs_to :item

 purchaseテーブル

| Column        | Type        | Options                        |    
| ---------     | ----------  | -----------------------------  |
| card_info     | Integer     | null: false                    |
| card_limit    | Integer     | null: false                    |
| security_code | Integer     | null: false                    | 
| user          | references  | null: false, foreign_key: true |
| item          | references  | null: false, foreign_key: true |


   Association
   
- belongs_to :user
- belongs_to :item
  has_one    :address


addressテーブル

| Column       | Type        | Options                        |    
| ---------    | ----------  | -----------------------------  |
| postal_code  | Integer     | null: false                    |
| prefectures  | string      | null: false                    |
| municipality | string      | null: false                    | 
| address      | string      | null: false                    | 
| building     | string      | null: false                    |
| phone_number | Integer     | null: false                    | 
| purchase     | references  | null: false, foreign_key: true |

   Association
   
- belongs_to :purchase

