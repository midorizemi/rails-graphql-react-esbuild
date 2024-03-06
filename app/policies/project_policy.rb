# frozen_string_literal: true

class ProjectPolicy < BasePolicy
  def show?
    true
  end

  def create?
    true
  end
end
