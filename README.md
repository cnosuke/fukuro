# Furoshiki

# LICENSE
MIT

# setup

1. mysqlの準備

```
% mysql -uroot -p
Enter password:
#略

mysql> create database furoshiki_development;
        Query OK, 1 row affected (0.01 sec)
```

2. 以下の環境変数に権限をもったmysqlのユーザーとPWをセット

`% export DATABASE_USER=db_user_name`

`% export DATABASE_PASSWORD=db_user_pw`

3. 必要なgemを入れる

`bundle install # furoshikiのrootディレクトリで`

4. dbのテーブル構築

`rake db:migrate`

5. railsの起動

`rails s`

