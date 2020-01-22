# frozen_string_literal: true

# Table for boards
class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
