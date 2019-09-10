# frozen_string_literal: true

module Mutations
  class CreateChat < BaseMutation
    argument :name, String, required: true
    type Types::ChatType

    def resolve(name: nil)
      Chat.create(name: name, user_id: context[:current_user].id)
    end
  end
end
