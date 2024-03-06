# frozen_string_literal: true

class BasePolicyScope
  attr_reader :user, :scope

  def initialize(user:, scope:)
    @user = user
    @scope = scope
  end

  def resolve
    raise NotImplementedError
  end
end
