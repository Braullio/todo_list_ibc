# frozen_string_literal: true

# Controller home boards
class BoardsController < ApplicationController
  before_action :boards, only: %i[index]
  before_action :board_params, only: %i[create update]
  before_action :board, only: %i[update destroy show]
  before_action :board, only: %i[update destroy show]
  before_action :board_index_modal, only: %i[index]
  before_action :board_show_modal, only: %i[show]

  def index; end

  def show; end

  def create
    @board = Board.new(@board_send)
    if @board.save
      redirect_type('success', 'create', 'root')
    else
      redirect_type('danger', 'create', 'root')
    end
  end

  def update
    if @board.update(board_params)
      redirect_type('success', 'update', 'board')
    else
      redirect_type('danger', 'update',  'board')
    end
  end

  def destroy
    if @board.destroy
      redirect_type('success', 'remove', 'root')
    else
      redirect_type('danger', 'remove', 'root')
    end
  end

  private

  def redirect_type(status, type, path_redirect)
    flash[status.to_sym] = (t "messages.#{status}.#{type}",
                              value: (t 'controller.board'))
    redirect_to path_redirect.to_sym
  end

  def board
    @board = Board.find(params[:id])
  end

  def boards
    @boards = Board.where('true')
  end

  def board_index_modal
    @action = 'create'
    @method = 'post'
    @title = nil
    @description = nil
  end

  def board_show_modal
    @action = 'update'
    @method = 'patch'
    @title = @board.title
    @description = @board.description
    @bg = 'bg-blue'
  end

  def board_params
    @board_send = params.permit(:title, :description)
  end
end
