# frozen_string_literal: true

module Types
  class ChatType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :user, UserType, null: true
    field :messages, [MessageType], null: true
  end
end
