# frozen_string_literal: true

class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  # ここで，GrqphQLAPIの認証を行います．特に重要な点は，current_userをcontextに追加することです．
  # 一旦，Deviseが提供しているヘルパーを呼び出して，認証をし，current_userを特定しています．
  # before_action :authenticate_user
  before_action :authenticate_user!

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    _json = params[:_json]

    context = {
      current_user:, # deviseのcurrent_userヘルぱーを呼び出しています．
      request:,
      controller_name: self.class.name,
    }

    result = RailsGraphqlReactEsbuildSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # フォームデータ、JSONボディ、または空白値の変数を処理する
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end

  private def authenticate_user
    authorization = request.headers["Authorization_Token"]
    if authorization.blank? # TODO: 認証情報が正しいかどうかを確認する
      render json: { errors: [{ message: "unauthorized" }] }, status: :unauthorized
      return
    end
    # @current_user = User.find_fron_authorization(authorization)
  end
end
