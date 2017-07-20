class ProductController < ApplicationController
  def index
    @order_item = current_order.order_items.new
  end

  def show
     @product = Product.find_by_id params[:id]
  end
end
