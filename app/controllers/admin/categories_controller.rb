class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user! ,:skiplayout, :new, :user_signed_in?, :is_admin?
  def index
   @categories = Category.all
  end

  def new
    @category = Category.new
  end
  def show
    category = Category.find_by_id params[:id]
    @products = category.products.paginate(page: params[:page], per_page: 1)
  end
  def create
    if category_params[:name_ct].blank? == true
      @category = Product.new(product_pamrams)
      if @category.save
       redirect_to admin_root_url
      else
        render :new
      end
    else
      @category = Category.new(category_params).products.new(product_pamrams)
      if @category.save
       redirect_to admin_root_url
      else
        render :new
      end
    end
  end

  def edit
  
  end

  def update
    
  end

  def destroy

  end

  private
    def category_params
      params.require(:category).permit(:name_ct)
    end

    def product_pamrams
      params.require(:category)
      .permit(:name, :price, :discount, :image, :description, :trademark, :category_id)
    end
end