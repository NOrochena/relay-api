# frozen_string_literal: true

class ModifyColumnNameInUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :name, :username
      t.string :password_digest
    end
  end
end
