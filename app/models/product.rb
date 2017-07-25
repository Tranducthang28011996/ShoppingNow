class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :reviews
  mount_uploader :image, ImageUploader
end
