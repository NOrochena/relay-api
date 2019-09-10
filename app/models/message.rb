# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  after_create :notify_subscriber_of_addition

  private

  def notify_subscriber_of_addition
    RelayApiSchema.subscriptions.trigger('newMessage', { 'chat' => chat_id.to_s }, self)
  end
end
