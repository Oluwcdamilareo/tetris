class OrdersController < ApplicationController

  def show
    @orders = Orders.where(:order_status_id = 2)
  end

  def create

  end

  def new
  end

  def destroy
  end
end
