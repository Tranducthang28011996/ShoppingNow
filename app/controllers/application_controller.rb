class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :subtotal
  def skiplayout
    @skip_layout = true
  end

  def subtotal
    current_order.order_items.map{|k| k.product.price*k.quantity}.sum
  end

  def current_order
    if session[:order_id]
       Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
