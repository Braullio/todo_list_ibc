# frozen_string_literal: true

# Table for lists
class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.belongs_to :board, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
