# frozen_string_literal: true

class BasePolicy
  attr_reader :user, :record, :by_system

  def initialize(user, record)
    @user = user
    @record = record
  end

  # すべてのアクションに対してデフォルトでtrueを返す．
  # show
  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
