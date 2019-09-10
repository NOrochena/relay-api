# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :newChat, Types::ChatType, null: false, description: 'A new Chat'
    def new_chat; end

    field :newMessage, Types::MessageType, null: false do
      argument :chat, String, required: true
    end
    def new_message(*); end
  end
end
