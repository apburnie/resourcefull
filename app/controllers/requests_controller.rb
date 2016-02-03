class RequestsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @request = Request.create(item_id: @item.id, user_id: current_user.id)
    redirect_to '/'
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to '/'
  end
end
