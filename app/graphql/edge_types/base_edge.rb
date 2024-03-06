# frozen_string_literal: true

module EdgeTypes
  class BaseEdge < GraphQL::Types::Relay::BaseEdge
    include GraphQL::Types::Relay::EdgeBehaviors
    node_nullable(false)
  end
end
