class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update!(product_params)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to 'index'
    else
      render 'show'
    end

  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :active, :featured, :image)
  end

end