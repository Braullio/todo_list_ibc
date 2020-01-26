# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  before(:all) do
    @list = create(:list)
  end

  it 'is valid with valid attributes' do
    expect(@list).to be_valid
  end

  it 'is not valid without a board_id' do
    list = build(:list, board_id: nil)
    expect(list).to_not be_valid
  end

  it 'is not valid without a title' do
    list = build(:list, title: nil)
    expect(list).to_not be_valid
  end
end
