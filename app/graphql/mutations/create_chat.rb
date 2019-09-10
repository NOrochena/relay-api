# frozen_string_literal: true

module Mutations
  class CreateChat < BaseMutation
    type Types::ChatType

    def resolve
      Chat.create(user_id: context[:current_user].id)
    end
  end
end
