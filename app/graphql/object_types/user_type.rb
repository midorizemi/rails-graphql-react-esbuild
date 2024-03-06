# frozen_string_literal: true

module ObjectTypes
  class UserType < ActiveRecordBaseObject
    global_id_field :id

    field :email, String, null: false # DBではNOT NULL制約がついているものであればnull: falseをつけるといいです．
    field :full_name, String, null: true

    field :projects, ObjectTypes::ProjectType.connection_type, null: false
    def projects
      dataloader.with(Sources::ActiveRecordObject, object.class, :projects).load(object.id)
    end

    field :owned_projects, ObjectTypes::ProjectType.connection_type, null: false
    def owned_projects
      dataloader.with(Sources::ActiveRecordObject, object.class, :owned_projects).load(object.id)
    end
  end
end
