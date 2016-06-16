class OrderMailMailer < ApplicationMailer

  def notify(order)
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info  = @order.info
    mail to: @user.email , subject: "[iShop]訂購產品通知"
  end

end
