# frozen_string_literal: true

ALLOWED_SCOPES = {
  '/' => nil,
  '/private-scoped' => ['read:all']
}.freeze

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authorized
  end

  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token(token)
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    return true if params[:query].include?('createUser') || params[:query].include?('create_user')

    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
