class SendMailJob < ApplicationJob
  queue_as :high

  def perform(order)
    OrderMailMailer.notify(order).deliver_now!
  end
end
