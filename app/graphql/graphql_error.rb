# frozen_string_literal: true

# Error Code that could be returned from GraphQL queries
module GraphqlError
  class ExecutionError < ::GraphQL::ExecutionError
    # @param [String] message
    # @param [String] code Error code, default to the CODE constant
    # @param [String] extensions Extra data for errors ("code" is also part of extensions)
    def initialize(message: self.class.const_get(:DEFAULT_MESSAGE), code: self.class.const_get(:CODE), **extensions)
      super(message, extensions: { code: }.merge(extensions))
    end
  end

  # Data

  class BadRequest < ExecutionError
    CODE = "BAD_REQUEST"
    DEFAULT_MESSAGE = "There are invalid parameters"
  end

  class Timeout < ExecutionError
    CODE = "TIMEOUT"
    DEFAULT_MESSAGE = "Request timeout"
  end

  class NotUnique < ExecutionError
    CODE = 'NOT_UNIQUE'
    DEFAULT_MESSAGE = 'The specified value is not unique'
  end

  class NotFound < ExecutionError
    CODE = "NOT_FOUND"
    DEFAULT_MESSAGE = "The specified resource is not found"
  end

  class NotAuthorized < ExecutionError
    CODE = "NOT_AUTHORIZED"
    DEFAULT_MESSAGE = "Operation not authorized"
  end

  class NotDeinedPolicy < ExecutionError
    CODE = "NOT_DEFINED_POLICY"
    DEFAULT_MESSAGE = "Policy for the specified resource is not defined"
  end
end
