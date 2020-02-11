class ItemsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
  
  def show
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end
  
end
