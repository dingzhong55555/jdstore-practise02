class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def update
    @cart_item = current_cart.cart_items.find_by_product_id(params[:id])
    @cart_item.update(cart_item_params)

    redirect_to :back
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end


end
