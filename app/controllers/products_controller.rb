class ProductsController < ApplicationController

  before_action :set_product


  def index
    @products = Product.all
  end

  def show
    @product.increment!(:score)
  end

  def add_to_cart
   current_cart.add(@product) unless current_cart.items.include?(@product)
   redirect_to :back
  end


  private

  def set_product
    @product =  Product.find_by(permalink: params[:permalink])
  end

end
