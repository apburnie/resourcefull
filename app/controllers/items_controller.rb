class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(required_params)
    current_user.items << @item
    if @item.save
      flash[:notice] = 'Thanks! Your item has been added'
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def required_params
    params.require(:item).permit(:name, :image)
  end
end
