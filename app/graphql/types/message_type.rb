# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    field :id, ID, null: true
    field :content, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :chat, ChatType, null: true
    field :user, UserType, null: true
  end
end
