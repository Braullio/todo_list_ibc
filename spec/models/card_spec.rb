# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:all) do
    @card = create(:card)
  end

  it 'is valid with valid attributes' do
    expect(@card).to be_valid
  end

  it 'is valid with valid attributes without a description' do
    card = build(:card, description: nil)
    expect(card).to be_valid
  end

  it 'is not valid without a list_id' do
    card = build(:card, list_id: nil)
    expect(card).to_not be_valid
  end

  it 'is not valid without a title' do
    card = build(:card, title: nil)
    expect(card).to_not be_valid
  end
end
