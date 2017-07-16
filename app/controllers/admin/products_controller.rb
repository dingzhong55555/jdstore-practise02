class Admin::ProductsController < ApplicationController
  before_action :require_is_admin
  before_action :authenticate_user!
  layout "admin"

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

  def require_is_admin
    if !current_user.admin?
      redirect_to :root
      flash[:warning] = "You are not admin"
    end

  end

  private

  def params_product
    params.require(:product).permit(:title, :description, :price, :quantity)
  end

end
