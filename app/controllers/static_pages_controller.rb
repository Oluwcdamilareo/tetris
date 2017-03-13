class StaticPagesController < ApplicationController
  def index
    @products = Product.where( "featured"  )
  end

  def store
  end

  def about
  end
end
