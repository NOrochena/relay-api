# frozen_string_literal: true

module Types
  class ResponseType < Types::BaseObject
    field :success, Boolean, null: true
    field :body, String, null: true
    field :error, String, null: true
  end
  end
