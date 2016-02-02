class ItemsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(required_params)
    flash[:notice] = 'Thanks! Your item has been added'
    redirect_to root_path
  end

  private

  def required_params
    params.require(:item).permit(:name)
  end
end
