# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [UserType], null: true
    def users
      User.all
    end

    field :chats, [ChatType], null: true
    def chats
      Chat.all
    end

    field :chat, ChatType, null: true do
      argument :id, ID, required: true
    end
    def chat(id: nil)
      Chat.find(id)
    end

    field :current_user, UserType, null: true
    def current_user
      context[:current_user]
    end
  end
end
