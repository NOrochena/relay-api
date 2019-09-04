# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    argument :username, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(username: nil, password: nil)
      user = User.create(username: username, password: password)
      user if user.valid?
    end
  end
end
