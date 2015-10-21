# Furoshiki

# LICENSE
MIT

# setup


### 1. 以下の環境変数に権限をもったmysqlのユーザーとPWをセット

`% export DATABASE_USER=db_user_name`

`% export DATABASE_PASSWORD=db_user_pw`

### 2. 必要なgemを入れる

`bundle install # furoshikiのrootディレクトリで`


### 3. DBの作成

`% bundle exec rake db:crate`

### 4. dbのテーブル構築

`bundle exec rake db:migrate`

### 5. railsの起動

`bundle exec rails s`

