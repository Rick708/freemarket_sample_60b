class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
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
  

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :status, :delivery_charge, :send_day, :size, :delivery_method, :prefecture_code, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
