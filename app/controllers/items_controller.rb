class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find_params, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    redirect_to user_session_path unless user_signed_in?
  end

  def edit
    redirect_to root_path if current_user.id == @item.user_id && !@item.history.nil?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :content_id, :charge_id, :area_id, :ship_id,
                                 :price).merge(user_id: current_user.id)
  end

  def item_find_params
    @item = Item.find(params[:id])
  end
end
