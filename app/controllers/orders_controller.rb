class OrdersController < ApplicationController
  before_action :item_find_params, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path unless user_signed_in?
    if user_signed_in?
      redirect_to root_path if current_user.id != @item.user_id && !@item.history.nil?
      redirect_to root_path if current_user.id == @item.user_id
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number, :history_id).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def item_find_params
    @item = Item.find(params[:item_id])
  end
end
