class HomeController < ApplicationController
  def index
    @products = Product.all.limit(8)
    @order_item = current_order.order_items.new
    @categories = Category.all
  end
end
