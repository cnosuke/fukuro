# Furoshiki

# LICENSE
MIT

# setup

1. 以下の環境変数に権限をもったmysqlのユーザーとPWをセット

`% export DATABASE_USER=db_user_name`

`% export DATABASE_PASSWORD=db_user_pw`

2. DBの作成

`% rake db:crate`

3. 必要なgemを入れる

`bundle install # furoshikiのrootディレクトリで`

4. dbのテーブル構築

`rake db:migrate`

5. railsの起動

`rails s`

