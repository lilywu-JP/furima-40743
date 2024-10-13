class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :check_soldout, :check_owner]
  before_action :check_soldout, only: [:index]
  before_action :check_owner, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :building,
                                           :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:item_price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def check_soldout
    return unless @item.sold_out?

    redirect_to root_path
  end

  def check_owner
    return unless current_user.id == @item.user.id

    redirect_to root_path
  end
end
