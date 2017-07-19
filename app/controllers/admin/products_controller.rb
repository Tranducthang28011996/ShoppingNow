class Admin::ProductsController < ApplicationController
  before_action :skiplayout
   def edit
      @product = Product.find_by_id params[:id]
    end
    def update
      @product = Product.find_by_id params[:id]
      @product.update(product_pamrams)
      redirect_to admin_root_url
    end

    def show
      @product = Product.find_by_id params[:id]
    end

    private
    def product_pamrams
      params.require(:product)
      .permit(:name, :price, :discount, :image, :description, :trademark, :category_id)
    end
end