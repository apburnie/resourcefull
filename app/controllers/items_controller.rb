class ItemsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @items = Item.all
    if current_user && current_user.items.any? { |item| item.request }
      flash[:alert] = %Q[You have requests pending. <a href="/borrowings">Manage requests</a>]
    end
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

  def update
    @item = Item.find(params[:id])
    @item.user_id = @item.request.user_id
    @item.request.destroy
    @item.request = nil
    @item.save
    redirect_to borrowings_path
  end

  private

  def required_params
    params.require(:item).permit(:name, :image)
  end
end
