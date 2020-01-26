# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }
  let(:board) { Board.create(title: Faker::FunnyName.name, description: Faker::Lorem.sentence) }
  let(:list)  { List.create(title: Faker::FunnyName.name, board_id: board.id) }
  let(:card)  { Card.create(title: Faker::FunnyName.name, description: Faker::Lorem.sentence, list_id: list.id) }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new List' do
        expect do
          post :create, params: { title: Faker::FunnyName.name, description: Faker::Lorem.sentence, list_id: list.id }, session: valid_session
        end.to change(Card, :count).by(1)
        expect(Board.count).to eq(1)
        expect(List.count).to eq(1)
      end
    end

    context 'with invalid params' do
      it 'not informad title' do
        expect do
          put :create, params: { list_id: list.id, description: Faker::Lorem.sentence }, session: valid_session
        end.to change(Card, :count).by(0)
      end

      it 'not informad list_id' do
        expect{
          put :create, params: { title: Faker::FunnyName.name }, session: valid_session
        }.to change(List, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
  context 'with valid params' do
    let(:new_attributes) do
      skip('Add a hash of attributes valid for your model')
    end

    let(:invalid_attributes) {
      skip('Add a hash of attributes invalid for your model')
    }

    it 'updates the requested board' do
      patch :update, params: { id: card.id, card_id: card.id, list_id: list.id, description: Faker::Lorem.sentence, title: Faker::FunnyName.name }, session: valid_session
      expect(Card.count).to eq(1)
    end
  end
end

  describe 'DELETE #destroy' do
    let(:new_attributes) do
      skip('Add a hash of attributes valid for your model')
    end

    let(:invalid_attributes) {
      skip('Add a hash of attributes invalid for your model')
    }

    it 'destroys the requested board' do
      delete :destroy, params: { card_id_del: card.id, id: list.id}, session: valid_session
      expect(Card.count).to eq(0)
    end
  end
end
