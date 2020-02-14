class ItemsController < ApplicationController
  before_action :login_check, {only: [:new, :create]}
  def index
  end

  def new
    @item = Item.new
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
  end

  def update
  end
  
  def show
  end

  def destroy
  end
  
  def login_check
    unless user_signed_in?
      redirect_to("/login")
    end
  end
  

  def item_params
    params.require(:item).permit(:name, :content, :price, :status, :delivery_charge, :send_day, :size, :delivery_method, :prefecture_code, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
