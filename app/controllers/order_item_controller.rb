class OrderItemController < ApplicationController
  def create
    @order = current_order
    if exists_product != true
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      flash[:danger] = 'Add to cart success!'
    else
      flash[:danger] = 'Product is exists in Your cart!'
    end
    session[:order_id] = @order.id
  end

  def update
    order_item_ids = params.keys.select{|key| key.include?('quantity')}
    order_items = current_order.order_items
    order_items.each_with_index do |value, index|
    value.update_attributes(quantity: params[order_item_ids[index]].to_i)
    end
    redirect_to :back
  end

  def destroy
    # byebug
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def order_item_params
    params.permit(:quantity, :product_id)
  end

  def exists_product
    current_order.order_items.map{|oi| oi.product.id}.include?(params[:product_id].to_i)
  end

end
