class StaticPagesController < ApplicationController
  def index
    @products = Product.where( "featured"  )
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
