class CartsController < ApplicationController


    def create
      @order_items = current_order.order_items.new(order_item_params)
      @order_items.save
    end

    def show
      @order_items = current_order.order_items
    end

  def update
    @order_items = current_order.order_items
    @order_items = current_order.order_items.find(params[:id])
    @order_items.update_attributes(order_item_params)
  end

  def destroy
    @order_items = current_order.order_items
    @order_items = current_order.order_items.find(params[:id])
    @order_items.destroy
  end

end
