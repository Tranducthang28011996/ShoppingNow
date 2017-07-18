class HomeController < ApplicationController
  def index
    # byebug
    @products = Product.all.limit(6)
    @order_item = current_order.order_items.new
  end
end
