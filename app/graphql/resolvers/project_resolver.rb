module Resolvers
  class ProjectResolver < Resolvers::BaseResolver
    description 'Find an Object by ID. Require ID'

    argument :id, ID, required: true, description: "GrqphQL ID not database id."

    type ObjectTypes::ProjectType, null: true

    def ready?(**args)
      object = context.schema.object_from_id(args[:id], context)
      policy = resource_policy(object)
      if policy && !policy.show?
        raise GraphqlError::NotAuthorized.new(message: "You're not authorized to get `#{object.class.name}##{object.id}`")
      end
    end

    def resolve(id:)
      object =
        if id.present?
          context.schema.object_from_id(id, context)
        else
          raise GraphqlError::BadRequest.new(message: "Missing required arguments: id")
        end
      object
    end
  end
end
