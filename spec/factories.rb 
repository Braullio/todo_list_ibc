# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :card do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.sentence }
    list { create(:random_list) }
  end

  factory :random_card, class: Card do
    title { Faker::Educator.course_name }
    description { Faker::Lorem.sentence }
    list { create(:random_list) }
  end

  factory :list do
    title { Faker::FunnyName.name }
    board { create(:random_board) }
  end

  factory :random_list, class: List do
    title { Faker::FunnyName.two_word_name }
    board { create(:random_board) }
  end

  factory :board do
    title { Faker::FunnyName.name }
    description { Faker::Lorem.sentence }
  end

  factory :random_board, class: Board do
    title { Faker::FunnyName.three_word_name }
    description { Faker::Lorem.sentence }
  end
end
