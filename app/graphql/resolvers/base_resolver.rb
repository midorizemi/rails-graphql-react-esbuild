module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    def current_user
      context.fetch(:current_user)
    end

    private def resource_policy(resource)
      # 認可処理はユースケースや開発チームによって異なるの．
      policy_constant = Object.const_get("#{resource.class.name}Policy")
      policy_constant.new(current_user, resource)
    rescue NameError
      raise GraphqlError::NotDeinedPolicy.new(message: "Policy for #{resource.class.name} is not defined");
    end
  end
end
