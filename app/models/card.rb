# frozen_string_literal: true

# == Schema Information
#
# Table name: cards
#
#  id             :BIGINT(20)     not null, primary key
#  tite           :VARCHAR(255)   not null
#  description    :TEXT
class Card < ApplicationRecord
  belongs_to :list

  validates :title, presence: true
end
