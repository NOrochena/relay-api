# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :messages
  has_many :chats
end
