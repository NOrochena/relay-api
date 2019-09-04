# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [UserType], null: true
    def users
      User.all
    end
  end
end
