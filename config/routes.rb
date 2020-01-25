# frozen_string_literal: true

Rails.application.routes.draw do
  root 'boards#index'
  resources :boards, only: %i[index show create update destroy]
  resources :lists, only: %i[create update destroy]
  post 'cards/update_list', to: 'cards#update_list'
  resources :cards, only: %i[create update destroy]

  # Errors pages
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_error'
end
