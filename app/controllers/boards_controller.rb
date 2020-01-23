# frozen_string_literal: true

# Controller home boards
class BoardsController < ApplicationController
  before_action :boards, only: %i[index]
  before_action :board_params, only: %i[create update]
  before_action :board, only: %i[update destroy show]
  before_action :board, only: %i[update destroy show]
  before_action :board_index_modal, only: %i[index]
  before_action :board_show_modal, only: %i[show]
  before_action :all_lists_for_board, only: %i[show]

  def index; end

  def show; end

  def create
    @board = Board.new(@board_send)
    if @board.save
      message_redirect_type('success', 'create', 'root', 'board')
    else
      message_redirect_type('danger', 'create', 'root', 'board')
    end
  end

  def update
    if @board.update(board_params)
      message_redirect_type('success', 'update', 'board', 'board')
    else
      message_redirect_type('danger', 'update',  'board', 'board')
    end
  end

  def destroy
    if @board.destroy
      message_redirect_type('success', 'remove', 'root', 'board')
    else
      message_redirect_type('danger', 'remove', 'root', 'board')
    end
  end

  private

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

  def all_lists_for_board
    @all_lists_for_board = List.where(board_id: @board)
  end
end
