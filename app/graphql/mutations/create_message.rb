# frozen_string_literal: true

module Mutations
  class CreateMessage < BaseMutation
    argument :chat_id, String, required: true
    argument :content, String, required: true

    type Types::MessageType

    def resolve(chat_id: nil, content: nil)
      Message.create(chat_id: chat_id, content: content, user_id: context[:current_user].id)
    end
  end
end
