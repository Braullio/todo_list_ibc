require 'rails_helper'
require 'faker'

RSpec.describe Board, type: :model do
  subject { Board.new }

  it 'is valid with valid attributes' do
    subject.title = Faker::Lorem.word
    subject.description = Faker::Lorem.sentence
    expect(subject.save).to eq(true)
  end

  it 'is not valid without a title' do
    expect(subject.save).to eq(false)
  end
end
