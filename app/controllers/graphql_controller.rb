class GraphqlController < ApplicationController
  before_action :authenticate_user

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = { current_user: @current_user }
    result = TodoApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  def authenticate_user
    token = request.headers["Authorization"]&.split(" ")&.last
    render :unauthorized unless token
    decoded_token = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key!).first
    @current_user = User.find(decoded_token['sub'])
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      JSON.parse(ambiguous_param) rescue {}
    when Hash, ActionController::Parameters
      ambiguous_param
    else
      {}
    end
  end
end
