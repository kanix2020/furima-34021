class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new   #「UserDonation」に編集
    @item = Item.find(params[:item_id])
    # @items = Item.all.includes(:user)
  end
  def create
    # @address = Address.new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)   #「UserDonation」に編集
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to action: :index
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
end
