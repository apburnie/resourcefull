class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items
  end
end
