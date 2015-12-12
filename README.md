# Furoshiki

# LICENSE
MIT

# setup

### 1. .envファイルに権限をもったmysqlのユーザーとPWを記述

```
# .envファイルはfuroshikiのrootディレクトリに置く
DATABASE_USER=db_user_name
DATABASE_PASSWORD=db_user_pw
```

### 2. 必要なgemを入れる

`bundle install # furoshikiのrootディレクトリで`


### 3. DBの作成

`% bundle exec rake db:create`

### 4. dbのテーブル構築

`bundle exec rake db:migrate`

### 5. railsの起動

`bundle exec rails s`

