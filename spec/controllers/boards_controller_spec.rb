# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:board) do
    Board.create(title: Faker::FunnyName.name, description: Faker::Lorem.sentence)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: board.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Board' do
        expect do
          post :create, params: { title: Faker::FunnyName.name }
        end.to change(Board, :count).by(1)
      end

      it 'redirects to the created board' do
        post :create, params: { title: Faker::FunnyName.name }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        expect{
          post :create, params: {}
        }.to change(Board, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested board' do
        patch :update, params: { id: board.id, title: Faker::FunnyName.name }
        expect(Board.count).to eq(1)
      end

      it 'redirects to the board' do
        patch :update, params: { id: board.id, title: Faker::FunnyName.name }
        expect(response).to redirect_to(board_url)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        expect{
          put :create, params: {}
        }.to change(Board, :count).by(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested board' do
      delete :destroy, params: { id: board.id }
      expect(Board.count).to eq(0)
    end

    it 'redirects to the boards list' do
      delete :destroy, params: { id: board.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
