class ItemsController < ApplicationController
  before_action :login_check, {only: [:new, :create]}
  def index
    @items = Item.includes(:images).limit(10).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '作成完了'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path(@item)
     else
      render :edit
     end
  end
  
  def show
  end

  def destroy
  end
  
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  

  def item_params
    params.require(:item).permit(:name, :content, :price, :status, :delivery_charge, :send_day, :size, :delivery_method, :prefecture_code, :condition, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
