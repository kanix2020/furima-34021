class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:item).permit(:image, :title, :description, :category_id, :item_state_id, :delivery_price_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
