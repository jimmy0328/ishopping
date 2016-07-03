class Admin::OrdersController < Admin::AdminController

  def index
    @orders = Order.all.page params[:page]
  end
end
