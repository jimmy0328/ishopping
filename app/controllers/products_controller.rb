class ProductsController < ApplicationController

  def add_to_cart
   @product =  Product.find(params[:id])
   current_cart.add(@product)
   redirect_to :back
  end
end
