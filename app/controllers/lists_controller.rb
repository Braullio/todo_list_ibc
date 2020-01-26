# frozen_string_literal: true

# Controller lists
class ListsController < ApplicationController
  before_action :list_params_json, only: %i[create]
  before_action :list, only: %i[update destroy]
  before_action :list_params, only: %i[update]

  def create
    @list = List.new(@list_send)
    if @list.save
      message_redirect_type('success', 'create', 'back', 'list')
    else
      message_redirect_type('danger', 'create', 'back', 'list')
    end
  end

  def update
    if @list.update(@list_send)
      message_redirect_type('success', 'update', 'back', 'list')
    else
      message_redirect_type('danger', 'update',  'back', 'list')
    end
  end

  def destroy
    if @list.destroy
      message_redirect_type('success', 'remove', 'back', 'list')
    else
      message_redirect_type('danger', 'remove', 'back', 'list')
    end
  end

  private

  def list
    @list = params[:list_id].present? ? List.find(params[:list_id]) : List.find(params[:list_id_del])
  end

  def list_params
    @list_send = params.permit(:list_title)
    @list_send['title'] = @list_send.delete('list_title')
  end

  def list_params_json
    @list_send = JSON.parse(params[:list_new]).with_indifferent_access
  end
end
