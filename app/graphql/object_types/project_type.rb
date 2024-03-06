# frozen_string_literal: true

module ObjectTypes
  class ProjectType < ActiveRecordBaseObject
    global_id_field :id

    field :name, String, null: true
    def name
      object.name
    end

    field :owner, ObjectTypes::UserType, null: true
    def owner
      dataloader.with(Sources::ActiveRecordObject, object.class, :owner).load(object.id)
    end

    field :members, ObjectTypes::UserType.connection_type, null: true
    def members
      dataloader.with(Sources::ActiveRecordObject, object.class, :users).load(object.id)
    end
  end
end
