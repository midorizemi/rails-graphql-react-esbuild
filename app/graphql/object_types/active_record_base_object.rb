# frozen_string_literal: true

module ObjectTypes
  class ActiveRecordBaseObject < ObjectTypes::BaseObject
    global_id_field :id
    implements GraphQL::Types::Relay::Node
    connection_type_class ConnectionTypes::BaseConnection
    edge_type_class(EdgeTypes::BaseEdge)

    field :database_id, String, null: false
    def database_id
      object.id
    end
  end
end
