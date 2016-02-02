class ItemsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(required_params)
    if @item.save
      current_user.items << @item
      flash[:notice] = 'Thanks! Your item has been added'
      redirect_to root_path
    else
      flash[:alert] = "Name "+(@item.errors[:name].join(' and ')+'.').to_s
      render "new"
    end
  end

  private

  def required_params
    params.require(:item).permit(:name, :image)
  end
end
