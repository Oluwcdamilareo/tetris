class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :new, :edit, :update, :destroy]

  layout 'header'

  def index
    @products = Product.all.search(params[:search]).paginate(page: params[:page], per_page: 8)
    @search = params[:search]
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end


  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
    @order_item.save
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
    params.require(:product).permit(:name, :price, :active, :status,:product_id, :image)
  end

end
