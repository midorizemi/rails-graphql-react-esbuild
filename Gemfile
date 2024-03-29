source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem 'graphql' # GraphQLのコア機能
gem "graphql-batch" # GraphQLのバッチローディング
gem "graphql-pagination" # GraphQLのページネーション
gem 'graphql-schema-directive-constraint' # GraphQLのスキーマディレクティブ

# 認証
gem "devise"

# ViewComponent
gem "view_component"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  # route．rbからフロントエンドでタイプセーフなURLを生成する
  gem 'ts_routes'

  gem 'graphiql-rails' # RailsからGraphiQL IDEをそうさする

  # モデルにアノテーションを追加する
  gem 'annotate'

  gem 'solargraph'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
