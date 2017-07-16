class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)

    if
      @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if
      @product.update(params_product)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private

  def params_product
    params.require(:product).permit(:title, :description, :price, :quantity)
  end

end
