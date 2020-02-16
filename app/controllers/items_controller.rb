class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:images).limit(5).order("created_at DESC")
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
  end
  
end
