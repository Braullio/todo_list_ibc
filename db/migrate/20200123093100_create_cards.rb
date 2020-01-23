# frozen_string_literal: true

# Table for cards
class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.belongs_to :list, foreign_key: true
      t.string :description
      t.string :title, null: false

      t.timestamps
    end
  end
end
