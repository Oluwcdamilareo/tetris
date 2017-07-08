class OrderItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  layout 'header'

  def show
    render 'carts/show'
  end

  def create
    if user_signed_in?
      @order = current_order
      @order_item = @order.order_items.new(order_item_params)
      @order_item.save!
      @order.progress!
      @order.save
      session[:order_id] = @order.id
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @order = current_order
    @order_items = @order.order_items
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)

  end
end
