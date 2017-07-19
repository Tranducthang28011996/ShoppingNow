class ProductController < ApplicationController
  def index
    @products =  Category.find(params[:id].to_i).products
    @order_item = current_order.order_items.new
  end

  def show
     @product = Product.find_by_id params[:id]
  end
end
