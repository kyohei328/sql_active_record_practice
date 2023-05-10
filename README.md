## プロジェクトのセットアップ手順
Dockerの利用有無によってそれぞれ構築方法が変わるので、下記に従い進めてください。
Dockerを利用したパターンの方が簡単に構築ができますので、お勧めします。
## Docker利用しない場合
### データのセットアップ
`config/database.yml`のusername, passwordを各自の環境に合わせて修正してください。

```
$ bundle install
$ bundle exec rails db:create
$ bundle exec rails db < db/seed.sql
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
