# frozen_string_literal: true

# List all cards for lists in board
module CardsHelper
  def all_cards_for_lists
    @all_cards = @list.cards
  end
end
