class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: [:account]

  layout 'header'

  def index
    @products = Product.where("status == ?", Product.statuses["featured"])[0..2]
    @order_item = OrderItem.new
  end

  def store
  end

  def about
  end

  def account
    if  admin_signed_in?
      @orders = Order.where("status == ?", Order.statuses[:placed])
    elsif user_signed_in?
      @orders = current_user.orders.reverse
    end
  end
end
