# frozen_string_literal: true

module Mutations
  # TODO: Rename to UpdateCurrentUser
  class ProjectCreate < BaseMutation
    # argument でリレーションを定義すると，自動的にIDからオブジェクトを解決してくれます．
    # その際にモデルにつけた名前_idという名前にしておく必要があります．
    argument :owner_id, ID, required: true, loads: ObjectTypes::UserType
    argument :name, String, required: true
    argument :user_ids, [ID], required: true, loads: ObjectTypes::UserType

    field :project_edge, ObjectTypes::ProjectType.edge_type, null: true

    def resolve(owner:, name:, users:)
      # create policyが常にfalseを返す用にしています．
      raise GraphqlError::NotAuthorized unless ProjectPolicy.new(current_user, nil).create?

      new_project = Project.create!(
        owner:,
        name:,
        users: users.push(owner)
      )

      range_add = GraphQL::Relay::RangeAdd.new(
        collection: Project.all,
        item: new_project,
        context:,
      )

      {
        project_edge: range_add.edge
      }
    end
  end
end
