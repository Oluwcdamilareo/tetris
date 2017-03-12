class StaticPagesController < ApplicationController
  def index
    @products = Product.where( "featured = 'true' " )
  end

  def store
  end

  def about
  end
end
