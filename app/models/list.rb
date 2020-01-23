# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id             :BIGINT(20)     not null, primary key
#  tite           :VARCHAR(255)   not null
#  description    :TEXT
class List < ApplicationRecord
  belongs_to :board

  validates :title, presence: true
end
