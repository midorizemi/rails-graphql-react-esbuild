# frozen_string_literal: true

class RailsGraphqlReactEsbuildSchema < GraphQL::Schema
  GraphQL::Schema::UniqueWithinType.default_id_separator = ":"

  query Types::QueryType
  mutation Types::MutationType

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader

  # GraphQL-Ruby calls this when something goes wrong while running a query:
  def self.type_error(err, context)
    # if err.is_a?(GraphQL::InvalidNullError)
    #   # report to your bug tracker here
    #   return nil
    # end
    super
  end

  # Union and Interface Resolution
  def self.resolve_type(abstract_type, obj, ctx)
    # TODO: Implement this method
    # to return the correct GraphQL object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Stop validating when it encounters this many errors:
  validate_max_errors(100)

  class << self
    def id_from_object(object, _type_definition = nil, _query_ctx = nil)
      return nil unless object

      # GrqphQL ID は文字列である必要があるため、文字列に変換する
      GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id).delete("=")
    end

    def object_from_id(id, _query_ctx = nil)
      type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id + ("=" * ((id.size * -1) & 3)))
      model = Object.const_get(type_name)
      _query_ctx.dataloader.with(Sources::RecordById, model).load(item_id)
    rescue NameError
      raise GraphqlError::InvalidId.new(id:)
    end

    def resolve_type(_type, object, _ctx)
      Object.const_get("ObjectTypes::#{object.class.name}Type")
    end
  end
end
