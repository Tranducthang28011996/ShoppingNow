class Admin::CategoriesController < ApplicationController

  before_action :skiplayout, :new
  def index
   @categories = Category.all
  end

  def new
    @category = Category.new
  end
  def show
    category = Category.find_by_id params[:id]
    @products = category.products
  end
  def create
    if params[:name_ct].nil? == false
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
    @category = Category.find_by_id params[:id]
  end

  def update
    @category = Category.find_by_id params[:id]
    if params[:name_ct] == nil
      @category = Product.update(product_pamrams)
       redirect_to admin_root_url
    else
      @category = Category.update(category_params)
       redirect_to admin_root_url
    end
  end

  def destroy
    @product = Product.find_by_id params[:id]
    @product.destroy
    respond_to do |format|
      format.html {}
      format.json {}
      format.js   { render :layout => false }
    end
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