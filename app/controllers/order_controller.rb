class OrderController < ApplicationController
  def show
    @orders = current_order.order_items
  end
end
