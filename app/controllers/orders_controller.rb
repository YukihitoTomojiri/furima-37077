class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private
  def order_params
    params.(:order_address).permit(:postal_code, :area_id, :municipality, :block, :building, :phone_number).merge(user_id: current_user.id)
  end
end
