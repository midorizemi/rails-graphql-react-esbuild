# frozen_string_literal: true

require "graphql/rake_task"

GraphQL::RakeTask.new(
  namespace: "graphql-ruby",
  schema_name: "RailsGraphqlReactEsbuildSchema",
)

namespace :graphql do
  namespace :schema do
    desc "Generate schema for the Apollo fragment matcher"
    task dump: :environment do
      Rake::Task["graphql-ruby:schema:idl"].invoke

      system("yarn graphql-codegen")
    end
  end
end
