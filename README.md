# README

# 環境構築
`config/database.yml`のusername, passwordを各自の環境に合わせて修正してください。

```
$ bundle install
$ bundle exec rails db:create
$ bundle exec rails db < db/seed.sql 
```

## 注意事項
MySQLの8系を使う場合は以下のエラーが出ると思われます。`db/seed.sql`から`NO_AUTO_CREATE_USER`の記述を全て削除することで解決できます。

```
$ rails db < db/seed.sql                                                                                                                                
ERROR 1231 (42000) at line 3348: Variable 'sql_mode' can't be set to the value of 'NO_AUTO_CREATE_USER'
```


# SQLの課題を解くには
SQLを実行するにはMySQLに接続する必要があります。
```
$ bundle exec rails dbconsole

...省略...

mysql> use sakila_rails_development
Database changed
mysql> ここにSQLを打つ

 
```

# ActiveRecordの課題を解くには
いつも通りrails consoleから実行すればOKです。
```
$ bundle exec rails console
 irb(main):001:0> Actor.first
    (0.5ms)  SET NAMES utf8mb4,  @@SESSION.sql_mode = CONCAT(CONCAT(@@sql_mode, ',STRICT_ALL_TABLES'), ',NO_AUTO_VALUE_ON_ZERO'),  @@SESSION.sql_auto_is_null = 0, @@SESSION.wait_timeout = 2147483
   Actor Load (0.2ms)  SELECT `actor`.* FROM `actor` ORDER BY `actor`.`actor_id` ASC LIMIT 1
 +----------+------------+-----------+-------------------------+
 | actor_id | first_name | last_name | last_update             |
 +----------+------------+-----------+-------------------------+
 | 1        | PENELOPE   | GUINESS   | 2006-02-15 04:34:33 UTC |
 +----------+------------+-----------+-------------------------+
 1 row in set
 irb(main):002:0> 

```

# 注意事項
一般的なRailsアプリと異なる点がいくつかあります。

例）
- テーブル名が全て単数系である
- `id`がないテーブルがある

このあたりを注意してSQLを組み立てましょう。
