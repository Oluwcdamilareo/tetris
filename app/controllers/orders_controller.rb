class OrdersController < ApplicationController

  before_action :authenticate_admin! unless :checkout


  def create

  end

  def show
    if admin_signed_in?
      @orders = Order.where("status == ?", Order.statuses[:placed]).reverse
    elsif user_signed_in?
      @orders = current_user.orders.reverse
    end
  end

  def destroy
    @order_items = current_order.order_items
    @order_items = current_order.order_items.find(params[:id])
    @order_items.destroy
  end

    def checkout
      @order = current_order
      @order.customer_name = current_user.first_name + ' ' + current_user.last_name
      @order.user_id = current_user.id
      @order.placed!
      @order.save
    end

  def delivered
    @order = Order.find(params[:order][:order_id])
    @order.delivered!
    @order.save
  end

private
  def order_params
    params.require(:order).permit(:customer_name, :delivery_address)
  end
end
