# frozen_string_literal: true

# == Schema Information
#
# Table name: boards
#
#  id             :BIGINT(20)     not null, primary key
#  tite           :VARCHAR(255)   not null
#  description    :TEXT
class Board < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates :title, presence: true
end
