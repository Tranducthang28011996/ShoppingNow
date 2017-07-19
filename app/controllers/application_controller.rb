class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :subtotal
  before_action :set_locale

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
#  I18n
  #mac dinh trinh duyet se chi dinh chay ngon ngu nao
  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
# function dung de khi minh dung scope trong routes
# thi khi chuyen trang van giu duoc trang thai cua ngon ngu dang chon
  def default_url_options
   { locale: I18n.locale }
  end
end
