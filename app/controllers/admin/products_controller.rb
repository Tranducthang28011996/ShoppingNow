class Admin::ProductsController < ApplicationController
  before_action :authenticate_user! ,:skiplayout, :user_signed_in?, :is_admin?
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

    def destroy
      @product = Product.find_by_id params[:id]
      @product.destroy
      respond_to do |format|
        format.html {redirect_to :back}
        format.json { head :no_content }
        format.js   { render layout: false }
      end
    end

    private
    def product_pamrams
      params.require(:product)
      .permit(:name, :price, :discount, :image, :description, :trademark, :category_id)
    end
end