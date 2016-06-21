class CartItemsController < ApplicationController

  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @item.product
    @item.destroy
    flash[:warning] = "成功將 #{@product.title} 從購物車刪除!"
  end

  def update
    @item = current_cart.cart_items.find_by(product_id: params[:cart_item][:product_id])
    @item.update(cart_item_params)
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
