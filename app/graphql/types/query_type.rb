# frozen_string_literal: true

module Types
  class QueryType < ObjectTypes::BaseObject
    include ActionView::Helpers::AssetUrlHelper

    prefix_path = "app/graphql/object_types/"
    exclude_filenames = %w[active_record_base_object.rb
                           base_connection.rb
                           base_object.rb
                           application_type.rb
                           ]
    Dir.glob("#{prefix_path}*") do |filename|
      filename = filename.gsub(prefix_path, "")

      if exclude_filenames.exclude?(filename)
        filename = filename.gsub("_type.rb", "")

        # object_types配下のファイルを読み込んで，それぞれのオブジェクトを取得するフィールドを定義
        field filename.to_sym, "ObjectTypes::#{filename.camelize}Type".constantize, null: true do
          argument :id, ID, required: false, description: "Optional if url is provided."
        end

        define_method filename do |id: nil, url: nil|
          object =
            if id.present?
              context.schema.object_from_id(id, context)
            else
              raise GraphqlError::BadRequest.new(message: "Missing required arguments: id or url")
            end

          policy = resource_policy(object)
          if policy && !policy.show?
            raise GraphqlError::NotAuthorized.new(message: "You're not authorized to get `#{object.class.name}##{object.id}`")
          end

          object
        end
      end
    end

    # 以下，オブジェクト以外のデータを取得するフィールド
    field :current_user, ObjectTypes::UserType, null: false
    field :projects, ObjectTypes::ProjectType.connection_type, null: false
    def projects
      ProjectPolicyScope.new(user: current_user, scope: Project.all).resolve
    end
    field :users, ObjectTypes::UserType.connection_type, null: false
    def users
      User.all
    end
  end
end
