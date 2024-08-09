class OrdersController < ApplicationController
  before_action :authenticate_user!,only:[:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :move_to_index, only:[:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_payment).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: (@item.price * 0.9).to_i,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end