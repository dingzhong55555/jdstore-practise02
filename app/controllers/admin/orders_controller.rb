class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @orders = Order.order(" id DESC ")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to :back
  end

  def require_is_admin
    if !current_user.admin?
      redirect_to :root
      flash[:warning] = "You are not admin"
    end
  end

end
