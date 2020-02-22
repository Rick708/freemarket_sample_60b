# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @tell = @user.build_tell
    render :new_tell
  end

  def create_tell
    @user = User.new(session["devise.regist_data"]["user"])
    @tell = Tell.new(tell_params)
    unless @tell.valid?
      flash.now[:alert] = @tell.errors.full_messages
      render :new_tell and return
    end
    @user.build_tell(@tell.attributes)
    @user.save
    sign_in(:user, @user)
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def tell_params
    params.require(:tell).permit(:telephone)
  end

end
