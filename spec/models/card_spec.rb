require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:board) { Board.create(title: Faker::FunnyName.name) }
  let(:list)  { List.create(title: Faker::FunnyName.name, board_id: board.id) }
  subject     { Card.new }

  it 'is valid with valid attributes' do
    subject.title = Faker::Lorem.word
    subject.description = Faker::Lorem.sentence
    subject.list_id = list.id
    expect(subject.save).to eq(true)
    expect(Card.first.id).to eq(1)
  end

  it 'is list_id nos present in attributes' do
    subject.title = Faker::Lorem.word
    subject.description = Faker::Lorem.sentence
    expect(subject.save).to eq(false)
  end

  it 'is title nos present in attributes' do
    Card.new(title: nil, description: Faker::Lorem.sentence, list_id: list.id)
    expect(Card.count).to eq(0)
  end
end
