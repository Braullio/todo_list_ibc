# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id             :BIGINT(20)     not null, primary key
#  tite           :VARCHAR(255)   not null
class List < ApplicationRecord
  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :title, presence: true
end
