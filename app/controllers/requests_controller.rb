class RequestsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @request = Request.create(item_id: @item.id, user_id: current_user.id)
    flash[:notice] = "#{@item.name} requested! Get in touch with #{@item.current_borrower} to get it"
    redirect_to '/'
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to '/borrowings'
  end
end
