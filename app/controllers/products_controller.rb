class ProductsController < ApplicationController

  before_action :set_product


  def show; end

  def add_to_cart
   current_cart.add(@product)
   redirect_to :back
  end


  private

  def set_product
    @product =  Product.find_by(permalink: params[:permalink])
  end

end
