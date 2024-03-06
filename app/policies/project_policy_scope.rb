# frozen_string_literal: true

class ProjectPolicyScope < BasePolicyScope
  def resolve
    # adminの場合はすべてのプロジェクトを見れる． 通常権限は自分が参加しているプロジェクトのみ．
    if user.admin?
      scope.all
    else
      scope.where(user: @user)
    end
  end
end
