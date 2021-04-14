class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: [:index]
  before_action :find_params, only: [:index, :create]

  def index
    @order_history = OrderHistory.new
    if @item.history.present?
      redirect_to root_path
    end
   
  end


  def create
    @order_history = OrderHistory.new(order_params)
    if @order_history.valid?
      pay_item
      @order_history.save
      redirect_to root_path
    else
      render action: :index
    end
  end



private
 def order_params
  params.require(:order_history).permit(:post_number, :shipment_area_id, :city, :address, :building_name, :phone_number,).merge(user_id: current_user.id, token: params[:token], item_id:params[:item_id])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy' 
      )
  end

  def sold_out_item
    redirect_to root_path if  @history.present?
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

end