# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true

    type Types::ResponseType

    def resolve(username: nil, password: nil)
      user = User.create(username: username, password: password)
      if user.valid?

        token = JWT.encode({ user_id: user.id }, Rails.application.credentials.jwt[:secret])
        {
          success: true,
          body: token
        }
      else
        { error: 'Invalid' }
      end
    end
  end
end
