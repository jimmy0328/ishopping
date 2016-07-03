class Admin::OrdersController < Admin::AdminController

  def index
    @orders = Order.all
  end
end
