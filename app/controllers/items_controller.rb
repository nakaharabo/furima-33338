class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only:[:show, :edit, :update]
  before_action :redirect_root, only:[:edit, :update]

  def index
    @items = Item.all.order(created_at: "DESC")
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path,method: :patch  
   else
     render :edit
   end
  end



  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :shipment_area_id, :shipment_day_id, :price,
     :state_id, :delivery_fee_id).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless current_user.id == @item.user_id
  end
end