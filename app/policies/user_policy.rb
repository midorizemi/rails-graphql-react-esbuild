# frozen_string_literal: true

class UserPolicy < BasePolicy
  def show?
    # Userを見れるのは，自分自身か，adminのみ
    @user == @record || @user.admin?
  end

  def update?
    @user == @record || @user.admin?
  end
end
