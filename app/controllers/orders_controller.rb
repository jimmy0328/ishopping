class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders =  Order.where(user_id: current_user.id)
  end

  def create
    @order =  current_user.orders.build
    if @order.save
      # TO FIX
      # when use current_user.orders.build(set_params) , @order.save will throw validate fail
      # because info validate order id is empty
      @order.update(set_params)
      @order.build_item_cache_from_cart(current_cart)
      @order.calculate_total!(current_cart)
      current_cart.delete
      #OrderMailMailer.notify(@order).deliver_now!
      SendMailJob.perform_later(@order)
      redirect_to orders_path
    else
      render "carts/checkout"
    end
  end

  private

  def set_params
    params.require(:order).permit(info_attributes: [:billing_name,
                                  :billing_address,
                                  :billing_tel,
                                  :shipping_name,
                                  :shipping_address,
                                  :shipping_tel] )
  end


end
