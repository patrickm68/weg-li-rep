class Api::ApplicationController < ActionController::Base
  include Swagger::Blocks

  protect_from_forgery with: :null_session
  before_action :api_sign_in

  rescue_from ActiveRecord::RecordNotFound, with: -> (ex) { render json: Api::Error.new(404, ex.message) }
  rescue_from StandardError, with: -> (ex) { render json: Api::Error.new(500, ex.message) }

  private

  def current_user
    @current_user
  end

  def api_sign_in
    api_token = request.headers['X-API-KEY'] || params['X-API-KEY']
    head :unauthorized if api_token.blank?

    @current_user = User.active.find_by(api_token: api_token)
    head :unauthorized if @current_user.blank?
  end
end
