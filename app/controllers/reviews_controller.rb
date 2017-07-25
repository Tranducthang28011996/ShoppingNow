class ReviewsController < ApplicationController
  def index
    @reviews=  Review.all
  end

  def new
  end

  def create
    byebug
  end

  def show
  end
end
