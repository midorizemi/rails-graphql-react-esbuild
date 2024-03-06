# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    object_class GraphQL::Schema::Object
    field_class FieldTypes::BaseField
    input_object_class InputTypes::BaseInputObject

    private def current_user
      context.fetch(:current_user)
    end

    private def request
      context.fetch(:request)
    end

    def operation_error_handler(operation:)
      case operation.error
      when operation.class::ERROR_POLICY_NOT_AUTHORIZED
        raise GraphqlError::NotAuthorized
      when operation.class::ERROR_NOT_UNIQUE
        raise GraphqlError::NotUnique
      when operation.class::ERROR_CONTRACT_VALIDATION
        raise ActiveModel::ValidationError, operation.contract
      else
        raise "Unexpected operation error. error: #{operation.error}"
      end
    end
  end
end
