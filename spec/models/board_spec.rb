# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  before(:all) do
    @board = create(:board)
  end

  it 'is valid with valid attributes' do
    expect(@board).to be_valid
  end

  it 'is not valid without a title' do
    board1 = build(:board, title: nil)
    expect(board1).to_not be_valid
  end
end
