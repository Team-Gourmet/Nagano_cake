class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).first(4)
  end

  def about
  end
end
