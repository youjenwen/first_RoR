## 使用方法
#### 啟動方式
1. clone 此專案
2. 進入專案 first_RoR 目錄底下下指令 `bundle install` 安裝 `Gemfile` 相關套件
3. `bin/rails db:migrate RAILS_ENV=development` 新增以 migrate 建立資料庫，不然會報錯
也可以輸入 `bin/rails db:migrate RAILS_ENV=test` 新增測試環境的資料庫
4. `rails server` 或是 `rails s`(縮寫) 啟動專案

##### 有頁面呈現
* http://127.0.0.1:4000/hello_world
* http://127.0.0.1:4000/users CRUD 建立使用者資料練習
* http://127.0.0.1:4000/posts CRUD 練習
* http://127.0.0.1:4000/candidates 候選人列表
* http://127.0.0.1:4000/bmi BMI 計算練習
##### 純 API
* http://127.0.0.1:4000/api/v1/articles `GET` All articles
* http://127.0.0.1:4000/api/v1/articles/{article.id} `GET` only one article
*  http://127.0.0.1:4000/api/v1/articles/ `POST` create new article
*  http://127.0.0.1:4000/api/v1/articles/{article.id} `PATCH` update article content
*  http://127.0.0.1:4000/api/v1/articles/{article.id} `DELETE` delete(destroy) article
#### 單元測試

* 針對 `spec/practice` 裡練習寫的測試
    * 直接移動到 `spec/practice` 目錄底下，使用 `rspec xxxxx_spec.rb` 進行測試
* `spec/controllers/api/v1/articles_controller_spec.rb` 測試自製api小功能
* `spec/controllers/users_controller_spec.rb` 使用 Scaffold 新建功能的測試