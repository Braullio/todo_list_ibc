# frozen_string_literal: true

# Controller of the Caards
class CardsController < ApplicationController
  before_action :set_card, only: %i[update destroy]
  before_action :card_params, only: %i[create update]
  before_action :card_for_update, only: %i[update_list]

  def create
    @card = Card.new(@card_send)
    if @card.save
      message_redirect_type('success', 'create', 'back', 'card')
    else
      message_redirect_type('danger', 'create', 'back', 'card')
    end
  end

  def update
    if @card.update(@card_send)
      message_redirect_type('success', 'update', 'back', 'card')
    else
      message_redirect_type('danger', 'update', 'back', 'card')
    end
  end

  def update_list
    if @card.update(list_id: @list_id)
      redirect_to_back
    else
      message_redirect_type('danger', 'update', 'back', 'card')
    end
  end

  def destroy
    if @card.destroy
      message_redirect_type('success', 'remove', 'back', 'card')
    else
      message_redirect_type('danger', 'remove', 'back', 'card')
    end
  end

  private

  def set_card
    params[:card_id].present? ? (@card = Card.find(params[:card_id])) : (@card = Card.find(params[:card_id_del]))
  end

  def card_for_update
    @card_update = JSON.parse(params[:update_list]).with_indifferent_access
    @card = Card.find(@card_update[:card_id])
    @list_id = @card_update[:list_id]
  end

  def card_params
    @card_send = params.permit(:title, :description, :list_id)
  end
end
