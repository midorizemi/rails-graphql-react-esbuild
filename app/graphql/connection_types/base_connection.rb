# frozen_string_literal: true

module ConnectionTypes
  class BaseConnection < GraphQL::Types::Relay::BaseConnection
    edges_nullable(false)
    edge_nullable(false)
    node_nullable(false)

    field :total_count, Integer, null: false

    def total_count
      count = object.items.size
      # NOTE: クエリにGROUP BYが含まれていると、countの結果が `{ "uuid" => 5, "uuid" => 3 }` のようなHashになってしまうため、ハッシュの要素数をカウントする
      count.is_a?(Hash) ? count.size : count
    end
  end
end
