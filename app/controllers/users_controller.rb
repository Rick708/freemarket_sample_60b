class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params,user_id: current_user.id)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def sell_list
    @item = Item.where(seller_id: current_user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
