# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :user_login, mutation: Mutations:: UserLogin
  end
end
