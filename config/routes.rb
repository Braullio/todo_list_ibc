# frozen_string_literal: true

Rails.application.routes.draw do
  root 'boards#index'
  resources :boards, only: %i[index show create update destroy]
  resources :lists, only: %i[create update destroy]
end
