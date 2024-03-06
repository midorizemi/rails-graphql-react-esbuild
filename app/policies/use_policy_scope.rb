# frozen_string_literal: true

class UserPolicyScope < BasePolicyScope
  def resolve
    # adminの場合はすべてのユーザーを見れる． 通常権限は他のユーザーは見えない
    if user.admin?
      scope.all
    else
      scope.none
    end
  end
end
