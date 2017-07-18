class OrderMailer < ApplicationMailer

  def notify_order_placed(@oder)
    @order = order
    @user = @order.user
    @producr_lists = @order.producr_lists

    mail(to: @user.email, subject: "[JDstore] 感谢您完成本次下单， 以下是您这次的购物明细#{@order.token}")s
  end
end
