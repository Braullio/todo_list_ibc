require 'rails_helper'

RSpec.describe List, type: :model do
  let(:board) { Board.create(title: Faker::FunnyName.name) }
  subject     { List.new }

  it 'is valid with valid attributes' do
    subject.title = Faker::Lorem.word
    subject.board_id = board.id
    expect(subject.save).to eq(true)
  end

  it 'is board_id nos present in attributes' do
    subject.title = Faker::Lorem.word
    expect(subject.save).to eq(false)
  end

  it 'is title nos present in attributes' do
    List.new(title: nil, board_id: board.id)
    expect(List.count).to eq(0)
  end
end
