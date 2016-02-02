class BorrowingsController < ApplicationController
  def index
    @items = current_user.items
  end
end
