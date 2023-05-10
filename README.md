## 目次
[プロジェクトのセットアップ手順](https://github.com/runteq/sql_active_record_practice/tree/feature/dockerize#%E3%83%97%E3%83%AD%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AE%E3%82%BB%E3%83%83%E3%83%88%E3%82%A2%E3%83%83%E3%83%97%E6%89%8B%E9%A0%86)  
[SQLの課題を解くには](https://github.com/runteq/sql_active_record_practice/tree/feature/dockerize#sql%E3%81%AE%E8%AA%B2%E9%A1%8C%E3%82%92%E8%A7%A3%E3%81%8F%E3%81%AB%E3%81%AF)  
[ActiveRecordの課題を解くには](https://github.com/runteq/sql_active_record_practice/tree/feature/dockerize#activerecord%E3%81%AE%E8%AA%B2%E9%A1%8C%E3%82%92%E8%A7%A3%E3%81%8F%E3%81%AB%E3%81%AF)  
[注意事項](https://github.com/runteq/sql_active_record_practice/tree/feature/dockerize#%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A0%85)

## プロジェクトのセットアップ手順
Dockerの利用有無によってそれぞれ構築方法が変わるので、下記に従い進めてください。
Dockerを利用したパターンの方が簡単に構築ができますので、お勧めします。

- [Dockerを利用しない場合](https://github.com/runteq/sql_active_record_practice/tree/feature/dockerize#docker%E5%88%A9%E7%94%A8%E3%81%97%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88)
- [Dockerを利用する場合](https://github.com/runteq/sql_active_record_practice/tree/feature/dockerize#docker%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B%E5%A0%B4%E5%90%88)
## Docker利用しない場合
### データのセットアップ
`config/database.yml`のusername, passwordを各自の環境に合わせて修正してください。

### 利用Gemのインストール
```
$ bundle install
```
### DB作成
```
$ bundle exec rails db:create
```
### データ入れ込み
```
$ bundle exec rails db < db/seed.sql
```

### データ入れ込み時にエラーが出た場合
データ入れ込み時にご利用のMySQLのバージョンによって以下のエラーが出る可能性があります。その場合は`db/seed.sql`のファイルから下記の削除対象のコードを削除してください。
#### エラー内容
```
$ rails db < db/seed.sql
ERROR 1231 (42000) at line 3348: Variable 'sql_mode' can't be set to the value of 'NO_AUTO_CREATE_USER'
```

#### 削除対象のコード
```sql
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
```


## Docker利用する場合
事前にDockerアプリがインストールされていることを確認してください。
### Dockerを使った環境準備(イメージのビルド)

```
docker compose build
```

### railsサーバーの起動(バックグラウンドでのコンテナの立ち上げとrailsサーバーの起動)

```
docker compose up -d
```

### コンテナ内に入る(rails・bundler・yarn関係のコマンドはコンテナ内で実行します)

```
docker compose exec web bash
```

### データベースの作成(コンテナ内で実行してください)

```bash
bin/rails db:create
```

### 利用するテーブルを作成(コンテナ内で実行してください)

```bash
bin/rails db < db/seed.sql
```
ここで下記のようにパスワードを聞かれた場合は、`password`と入力してください。  
**実際に打った文字は見えないので注意してください**
```shell
Enter password:
```

### Dockerコンテナの終了する場合

```bash
docker compose down
```

### デバッグツールを使うときは

#### railsサーバーを立ち上げているコンテナ名を確認する

```bash
docker compose ps
```

#### 該当のコンテナ名をattachする

```bash
docker attach コンテナ名
```

## SQLの課題を解くには
下記のコマンドでMySQLに接続してSQLを実行することができます。
Dockerを利用している場合は、`docker compose exec web bash`でコンテナ内に入ってから実行してください。
```
$ bin/rails dbconsole

...省略...

mysql> use sakila_rails_development;
Database changed
mysql> ここにSQLを打つ
```

## ActiveRecordの課題を解くには
下記のコマンドを実行してください。
Dockerを利用している場合は、`docker compose exec web bash`でコンテナ内に入ってから実行してください。

```
$ bin/rails console
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

## 注意事項
一般的なRailsアプリと異なる点がいくつかあります。

例）
- テーブル名が全て単数系である
- `id`がないテーブルがある

このあたりを注意してSQLを組み立てましょう。
