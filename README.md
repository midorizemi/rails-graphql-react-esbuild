# rails-graphql-react-esbuild

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

React Comopnentの追加はjavascripts/の配下にtsxを追加すればESbuildがビルドしてくれる．
Railsでは複数画面にて，コンポーネントを部分的に追加したいので，マウントを個別に行う仕組みが必要となる．
なので，　moute.tsxを追加しました．

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