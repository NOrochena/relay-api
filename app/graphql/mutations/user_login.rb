# frozen_string_literal: true

module Mutations
  class UserLogin < BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true

    type Types::ResponseType3

    def resolve(username: nil, password: nil)
      user = User.find_by(username: username)
      if user&.authenticate(password)
        token = encode_token(user_id: user.id)
        {
          success: true,
          body: token
        }
      else
        { error: 'Invalid OTP' }
      end
    end
  end
  end
