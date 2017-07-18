class Category < ApplicationRecord
  attr_accessor :price, :discount, :description, :name, :category_id, :image, :trademark
  has_many :products, :dependent => :destroy
  validates :name_ct, presence: true
end
