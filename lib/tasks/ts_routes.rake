# frozen_string_literal: true

namespace :ts_routes do
  desc "Generate routes.ts"
  task generate: :environment do
    path = "app/javascript/generated"
    unless File.directory?(path)
      # NOTE: javascripts/ に　generates ディレクトリを作成してください
      puts "Creating directory: #{path}"
      FileUtils.mkdir_p(path)
    end
    ts_routes_filename = "#{path}/routes.ts"
    source = TsRoutes.generate(exclude: [/rails/, /sidekiq/, /letter_opener/])
    File.write(ts_routes_filename, source)
  end
end
