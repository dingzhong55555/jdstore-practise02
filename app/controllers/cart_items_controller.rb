class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end
end
