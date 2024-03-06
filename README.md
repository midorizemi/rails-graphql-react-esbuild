# rails-graphql-react-esbuild

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

.tool-versions
.ruby-versions
.node-version

* System dependencies
Docker, Docker-Compose, asdf

* アプリをビルドして立ち上げる
```
  docker compose -f compose.yml up --build
```

以下の表示が出たらOK
```
rails-exam-web        | 03:16:19 web.1   | Puma starting in single mode...
rails-exam-web        | 03:16:19 web.1   | * Puma version: 6.4.2 (ruby 3.2.2-p53) ("The Eagle of Durango")
rails-exam-web        | 03:16:19 web.1   | *  Min threads: 5
rails-exam-web        | 03:16:19 web.1   | *  Max threads: 5
rails-exam-web        | 03:16:19 web.1   | *  Environment: development
rails-exam-web        | 03:16:19 web.1   | *          PID: 10
rails-exam-web        | 03:16:19 web.1   | * Listening on http://0.0.0.0:3000
rails-exam-web        | 03:16:19 web.1   | Use Ctrl-C to stop
rails-exam-web        | 03:18:15 system  | SIGTERM received, starting shutdown
```

 ビルドとか関係なしに普通に立ち上げたかったら　`--build` をつけないでコマンド実行すればいけます

* Database creation
DB作る

```
docker exec -it rails-exam-web bin/rails db:create
```

マイグレーションする
```
docker exec -it rails-exam-web bin/rails db:migrate
```

* Database initialization

```
docker exec -it rails-exam-web bin/rails db:seed
```
* アプリの動作を確認する
seedを実行していたら，ログインは以下でできます．

- email: `tset@test`
- password: `password`

パスについて
- Web画面ログイン
  - [http://localhost:8080/users/sign_in](http://localhost:8080/users/sign_in)
  - deviseでログインできます．
- TOP画面
  - [http://localhost:8080](http://localhost:8080)
- GraphiQLのWebクライアント
  - [http://localhost:8080/graphiql](http://localhost:8080/graphiql)

* 設定・Configuration


* ディレクトリ・ファイル説明
- ./app/javascript/ フロント側の開発
- ./app/graphql/ GrqphQLに関する詳細の開発
- ./app/graphql/rails_graphql_react_esbuild_schema.rb GraphQLスキーマの振る舞いを定義したファイル
- ./app/controller/graphql_controller.rb GraphQLAPIエンドポイント
- ./schema.graphql GraphQL-Rubyで自動生成されたGraphQLのスキーマファイル
- ./tsconfig*.json TSファイルの定義（ESLintで必要なため，ESBuildを使っているのでビルドには利用されていません）
- ./codegen.yml GraphQLでTS型定義をどう生成するかを設定しているファイル

* Deployment instructions

* Reactフロントエンド
React Comopnentの追加はjavascripts/の配下にtsxを追加すればESbuildがビルドしてくれる．
Railsでは複数画面にて，コンポーネントを部分的に追加したいので，マウントを個別に行う仕組みが必要となる．
なので，　monte.tsxを追加しました．

* graphql
schema.graphqlを更新したい場合は，

```
docker exec -it rails-exam-web bin/rails graphql:schema:dump
```

* GraphQLのフロントエンド側の変更をTSに反映したい場合

```
docker exec -it rails-exam-web yarn graphql-codegen
```


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Installation

install ruby newest
Don't forget set Rails 7.1 versioin

```
asdf install ruby 3.2.2
asdf local ruby 3.2.2
asdf reshim ruby
asdf install nodejs 20.11.1
asdf local nodejs 20.11.1
asdf reshim nodejs
corepack enable

gem install rails
```

First, start by setting up Rails with the `new` command.
You'll want to keep the Rails setup simple.
For this project, we'll use Rails apps, GraphQL, React, ESbuild, and Tailwind.
Make sure to use Tailwind for CSS and ESbuild for JavaScript building.
Also, we plan to create a login screen with Devise and show a React page inside.
Here, we'll use GraphQL for a simple API endpoint, so we won't set Rails up in API mode.
Here are the options you can use:

```sh
rails new . \
 --skip-active-job \
 --skip-action-mailer \
 --skip-active-storage \
 --skip-action-mailbox \
 --skip-action-text \
 --skip-hotwire \
 --skip-action-cable \
 --skip-bootsnap \
 --skip-dev-gems \
 --skip-jbuilder \
 --skip-system-test \
 --javascript esbuild \
 --css tailwind \
 -d postgresql
```

add gitfiles

```
git add .git*
git commit -m 'Add gitfiles'
```
