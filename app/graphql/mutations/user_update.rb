# frozen_string_literal: true

module Mutations
  class UserUpdate < BaseMutation
    # ミューテーションに必要な引数（必須および任意）を定義します。
    # `loads:` を使用して ID を UserType オブジェクトに自動的に解決します。
    argument :user_id, ID, required: true, loads: ObjectTypes::UserType
    argument :full_name, String, required: false

    # `user_edge` フィールドは UserType に関連するエッジタイプを返します。
    # これは、データをノードとエッジのグラフとして管理する Relay または Relay ライクなクライアント実装にとって重要です。
    # エッジを返すことで、クライアントは全体の接続を再取得することなく、更新されたユーザーを接続に統合できます。
    field :user_edge, ObjectTypes::UserType.edge_type, null: false

    def resolve(user:, full_name: nil)
      # 現在のユーザーがこの更新を実行できるかどうかの認証チェック。
      raise GraphqlError::NotAuthorized unless UserPolicy.new(current_user, user).update?

      # ユーザーを更新する処理
      user.update!(full_name:)

      # ここでは、ミューテーションのレスポンスの一部としてエッジを返す準備をしています。
      # これはクライアントサイドの統合にとって重要なステップであり、クライアントのローカルキャッシュへの効率的な更新を可能にします。
      # 特に、更新されたノード（ユーザー）をエッジ内に提供することで、アイテムのリストに利益をもたらします。
      range_add = GraphQL::Relay::RangeAdd.new(
        collection: User.all, # ユーザーが属するコレクション。
        item: user, # 更新されたユーザー。
        context: context, # GraphQL 実行コンテキスト。
      )

      # user_edge を返します。このエッジにはユーザーノードだけでなく、カーソル情報も含まれています。
      # これにより、クライアントはユーザーのコレクション内の位置を理解するのに役立ちます。
      # これは、クライアントサイドのページネーションやリストの更新に特に有用です。
      # GrqphQLRubyのレスポンスのフィールドは，スネークケースで返します．
      # フロントエンドのクエリではキャメルケースなので注意が必要です．
      {
        user_edge: range_add.edge
      }
    end
  end
end
