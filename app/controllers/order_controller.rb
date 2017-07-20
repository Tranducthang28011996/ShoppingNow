class OrderController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

 def destroy
  @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
  respond_to do |format|
    format.html {}
    format.json { head :no_content }
    format.js   { render layout: false }
  end
end
end
