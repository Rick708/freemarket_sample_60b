class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_item

#itemのデータとcard情報を両方記載
  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  # 購入の処理です
  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

  private

  #itemの情報を持ってくるために記述した
  def set_item
    @item = Item.find(params[:id])
  end

end 
