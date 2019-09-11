# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages
  after_save :notify_subscriber_of_addition

  private

  def notify_subscriber_of_addition
    GraphqlApiSchema.subscriptions.trigger('newChat', {}, self)
  end
end
