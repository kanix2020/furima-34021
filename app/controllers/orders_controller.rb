class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    return redirect_to root_path if @item.order != nil || current_user == @item.user
    #   redirect_to root_path
    # end
    # unless @item.order == nil
    #   redirect_to root_path
    # end

    # if current_user == @item.user 
      # redirect_to root_path 
      # and return

      @order_address = OrderAddress.new   
  end

  def create
    @order_address = OrderAddress.new(order_params)   
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to item_path(@item)
    else
      render action: :index
    end
  end
  
  private
  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id:(params[:item_id]))
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
