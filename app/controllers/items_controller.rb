class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :the_person, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC').includes(:user)
  end

  def edit
  end

  def show
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

  def update
    if @item.update(article_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def article_params
    params.require(:item).permit(:image, :title, :description, :category_id, :item_state_id, :delivery_price_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def the_person
    redirect_to action: :index unless @item.user == current_user
  end
end
