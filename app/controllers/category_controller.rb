class CategoryController < ApplicationController
  def show
    @products =  Category.find(params[:id]).products
  end
end