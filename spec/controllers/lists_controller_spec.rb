# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:valid_session) { {} }
  let(:board) { Board.create(title: Faker::FunnyName.name, description: Faker::Lorem.sentence) }
  let(:list)  { List.create(title: Faker::FunnyName.name, board_id: board.id) }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new List' do
        expect do
          @list_new = { title: Faker::FunnyName.name, board_id: board.id }.to_json
          post :create, body: { list_new: @list_new }.to_json, as: :json
        end.to change(List, :count).by(1)
        expect(Board.count).to eq(1)
      end
    end

    context 'with invalid params' do
      it 'not informad title' do
        expect do
          @list_new = { board_id: board.id }.to_json
          post :create, body: { list_new: @list_new }.to_json, as: :json
        end.to change(List, :count).by(0)
        expect(Board.count).to eq(1)
      end

      it 'not informad list_id' do
        expect do
          @list_new = { title: Faker::FunnyName.name }.to_json
          post :create, body: { list_new: @list_new }.to_json, as: :json
        end.to change(List, :count).by(0)
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

    let(:valid_session) { {} }
    let(:board) { Board.create(title: Faker::FunnyName.name, description: Faker::Lorem.sentence) }
    let(:list)  { List.create(title: Faker::FunnyName.name, board_id: board.id) }

    it 'updates the requested board' do
      patch :update, params: { id: list.id, list_id: list.id, list_title: Faker::FunnyName.name }
      expect(List.count).to eq(1)
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

    let(:valid_session) { {} }
    let(:board) { Board.create(title: Faker::FunnyName.name, description: Faker::Lorem.sentence) }
    let(:list)  { List.create(title: Faker::FunnyName.name, board_id: board.id) }

    it 'destroys the requested board' do
      delete :destroy, params: { list_id_del: list.id, id: list.id}
      expect(List.count).to eq(0)
    end
  end
end
